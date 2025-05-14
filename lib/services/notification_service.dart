import 'dart:io' show Platform;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:mr/models/medicine_model.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    try {} catch (e) {}

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
          '@mipmap/ic_launcher', // Ensure this icon exists
        );

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {},
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );
    } catch (e) {}

    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      if (result == false) {}
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      bool? notificationPermissionGranted;
      try {
        notificationPermissionGranted =
            await androidImplementation?.requestNotificationsPermission();
        if (notificationPermissionGranted == false) {}
      } catch (e) {}

      bool? exactAlarmPermissionGranted;
      try {
        exactAlarmPermissionGranted =
            await androidImplementation?.requestExactAlarmsPermission();
        if (exactAlarmPermissionGranted == false) {}
      } catch (e) {}

      if (notificationPermissionGranted == false ||
          exactAlarmPermissionGranted == false) {}
    }
  }

  Future<void> scheduleMedicineNotifications(MedicineModel medicine) async {
    await cancelMedicineNotifications(medicine.id.toString());

    if (!medicine.notificationsEnabled || medicine.isCompleted) {
      return;
    }

    final DateTime startDateFromModel = medicine.startDate.toDate();

    final DateTime endDate = startDateFromModel.add(
      Duration(days: medicine.duration),
    );

    final String medicineName = medicine.name;
    final String dosageInfo =
        "${medicine.dosageQuantity} ${medicine.dosageUnit}";

    String medIdStr =
        // ignore: unnecessary_type_check
        medicine.id is String ? medicine.id : medicine.id.toString();
    int baseId = (medIdStr.hashCode % 2000000000).abs();
    int notificationIdCounter = baseId;

    for (int day = 0; day < medicine.duration; day++) {
      DateTime currentDayBase = startDateFromModel.add(Duration(days: day));

      for (String timeStr in medicine.doseHours) {
        try {
          List<String> parts = timeStr.split(':');
          if (parts.length != 2) {
            continue;
          }
          int hour = int.parse(parts[0]);
          int minute = int.parse(parts[1]);

          tz.TZDateTime currentDayInLocalTz = tz.TZDateTime.from(
            currentDayBase,
            tz.local,
          );

          tz.TZDateTime doseDateTimeInLocalTz = tz.TZDateTime(
            tz.local,
            currentDayInLocalTz.year,
            currentDayInLocalTz.month,
            currentDayInLocalTz.day,
            hour,
            minute,
          );

          tz.TZDateTime notificationDateTimeInLocalTz = doseDateTimeInLocalTz
              .subtract(const Duration(minutes: 3));
          tz.TZDateTime endDateInLocalTz = tz.TZDateTime.from(
            endDate,
            tz.local,
          );
          tz.TZDateTime nowInLocalTz = tz.TZDateTime.now(tz.local);

          print('--- Notification Debug ---');
          print('Medicine: $medicineName');
          print('Start Date: $startDateFromModel');
          print('Current Time: ${DateTime.now()}');
          print('TZ Now: $nowInLocalTz');
          print('Dose Time (Local TZ): $doseDateTimeInLocalTz');
          print('Notification Time (Local TZ): $notificationDateTimeInLocalTz');
          print('End Date: $endDate');
          print(
            'Notification will be scheduled: ${notificationDateTimeInLocalTz.isAfter(nowInLocalTz) && notificationDateTimeInLocalTz.isBefore(endDateInLocalTz)}',
          );

          if (notificationDateTimeInLocalTz.isAfter(nowInLocalTz) &&
              notificationDateTimeInLocalTz.isBefore(endDateInLocalTz)) {
            try {
              await flutterLocalNotificationsPlugin.zonedSchedule(
                notificationIdCounter,
                'time_for_medicine'.tr,
                'take_medicine_now'.tr
                    .replaceAll('{dosageInfo}', dosageInfo)
                    .replaceAll('{medicineName}', medicineName),
                notificationDateTimeInLocalTz,
                const NotificationDetails(
                  android: AndroidNotificationDetails(
                    'medicine_channel_id',
                    'Medicine Reminders',
                    channelDescription: 'Notifications for medicine doses',
                    importance: Importance.max,
                    priority: Priority.high,
                    ticker: 'ticker',
                    playSound: true,
                  ),
                  iOS: DarwinNotificationDetails(
                    presentAlert: true,
                    presentBadge: true,
                    presentSound: true,
                  ),
                ),
                androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
                matchDateTimeComponents: DateTimeComponents.dateAndTime,
                payload:
                    'medicineId=${medicine.id}&doseTime=$doseDateTimeInLocalTz',
              );
            } catch (e) {}
            notificationIdCounter++;
          } else {}
        } catch (e) {}
      }
    }
  }

  Future<void> cancelMedicineNotifications(String medicineId) async {
    String medIdStr = medicineId;
    int baseId = (medIdStr.hashCode % 2000000000).abs();
    int maxNotificationsToCancel = 200;
    // ignore: unused_local_variable
    int cancelledCount = 0;
    for (int i = 0; i < maxNotificationsToCancel; i++) {
      try {
        await flutterLocalNotificationsPlugin.cancel(baseId + i);
        cancelledCount++;
      } catch (e) {}
    }
  }

  Future<void> cancelAllNotifications() async {
    try {
      await flutterLocalNotificationsPlugin.cancelAll();
    } catch (e) {}
  }

  Future<void> checkPendingNotifications() async {
    try {
      final List<PendingNotificationRequest> pendingRequests =
          await flutterLocalNotificationsPlugin.pendingNotificationRequests();
      if (pendingRequests.isEmpty) {
      } else {
        // ignore: unused_local_variable
        for (PendingNotificationRequest request in pendingRequests) {}
      }
    } catch (e) {}
  }
}
