import 'dart:io' show Platform;
import 'package:flutter/foundation.dart'; // For kDebugMode
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:mr/models/medicine_model.dart'; // Assuming this path is correct

// Callback for when a notification is tapped while the app is in the background (iOS specific).
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
  print('Notification tapped in background: ${notificationResponse.payload}');
}

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
    print("NotificationService: Initializing...");
    tz.initializeTimeZones();
    final String currentTimeZone = await tz.local.name;
    print("NotificationService: Current timezone: $currentTimeZone");

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
          '@mipmap/ic_launcher', // Ensure this icon exists
        );

    // Removed onDidReceiveLocalNotification for compatibility with user's plugin version
    final DarwinInitializationSettings
    initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false, // Permissions will be requested explicitly
      requestBadgePermission: false,
      requestSoundPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification, // Removed due to user-reported error
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    try {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (
          NotificationResponse notificationResponse,
        ) async {
          final String? payload = notificationResponse.payload;
          print('NotificationService: Notification tapped. Payload: $payload');
          // Handle notification tap
        },
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );
      print(
        "NotificationService: FlutterLocalNotificationsPlugin initialized successfully.",
      );
    } catch (e) {
      print(
        "NotificationService: Error initializing FlutterLocalNotificationsPlugin: $e",
      );
    }

    await _requestPermissions();
  }

  // This function might not be called if onDidReceiveLocalNotification is removed from DarwinInitializationSettings.
  // It's kept here for now in case it's used elsewhere or if a different iOS initialization is needed for older versions.
  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    print(
      'NotificationService: onDidReceiveLocalNotification: id=$id, title=$title, payload=$payload',
    );
    // Display a dialog or handle the notification
  }

  Future<void> _requestPermissions() async {
    print("NotificationService: Requesting permissions...");
    if (Platform.isIOS) {
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      print("NotificationService: iOS permission request result: $result");
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      bool? notificationPermissionGranted =
          await androidImplementation?.requestNotificationsPermission();
      print(
        "NotificationService: Android notification permission granted: $notificationPermissionGranted",
      );

      bool? exactAlarmPermissionGranted =
          await androidImplementation?.requestExactAlarmsPermission();
      print(
        "NotificationService: Android exact alarm permission granted: $exactAlarmPermissionGranted",
      );

      if (notificationPermissionGranted == false ||
          exactAlarmPermissionGranted == false) {
        print(
          "NotificationService: One or more critical permissions denied on Android.",
        );
      }
    }
  }

  Future<void> scheduleMedicineNotifications(MedicineModel medicine) async {
    print(
      "NotificationService: Attempting to schedule notifications for medicine: ${medicine.name} (ID: ${medicine.id})",
    );
    print(
      "NotificationService: Medicine details: notificationsEnabled=${medicine.notificationsEnabled}, isCompleted=${medicine.isCompleted}, duration=${medicine.duration} days, doseHours=${medicine.doseHours}",
    );

    await cancelMedicineNotifications(medicine.id);

    if (!medicine.notificationsEnabled || medicine.isCompleted) {
      print(
        "NotificationService: Notifications disabled or medicine completed for ${medicine.name}. Skipping scheduling.",
      );
      return;
    }

    final DateTime startDate = medicine.startDate.toDate();
    print(
      "NotificationService: Medicine start date (from model, potentially UTC): $startDate",
    );

    final DateTime endDate = startDate.add(Duration(days: medicine.duration));
    print("NotificationService: Medicine end date (calculated): $endDate");

    final String medicineName = medicine.name;
    final String dosageInfo =
        "${medicine.dosageQuantity} ${medicine.dosageUnit}";

    int baseId = (medicine.id.hashCode % 2000000000).abs();
    int notificationIdCounter = baseId;

    print(
      "NotificationService: Scheduling notifications for ${medicine.name} (ID: ${medicine.id}, Base Notification ID: $baseId). StartDate (local interpretation of model's date): ${tz.TZDateTime.from(startDate, tz.local)}",
    );

    for (int day = 0; day < medicine.duration; day++) {
      DateTime currentDayBase = startDate.add(Duration(days: day));

      for (String timeStr in medicine.doseHours) {
        print(
          "NotificationService: Processing day $day, dose time string: $timeStr for ${medicine.name}",
        );
        try {
          List<String> parts = timeStr.split(':');
          if (parts.length != 2) {
            print(
              "NotificationService: Invalid time string format: $timeStr for ${medicine.name}. Skipping this dose time.",
            );
            continue;
          }
          int hour = int.parse(parts[0]);
          int minute = int.parse(parts[1]);

          tz.TZDateTime currentDayInLocalTz = tz.TZDateTime.from(
            currentDayBase,
            tz.local,
          );
          print("-----------------------------");
          print(currentDayInLocalTz);
          print("-----------------------------");
          tz.TZDateTime doseDateTimeInLocalTz = tz.TZDateTime(
            tz.local,
            currentDayInLocalTz.year,
            currentDayInLocalTz.month,
            currentDayInLocalTz.day,
            hour,
            minute,
          );
          print(
            "NotificationService: Calculated doseDateTime (local): $doseDateTimeInLocalTz for ${medicine.name}",
          );

          tz.TZDateTime notificationDateTimeInLocalTz = doseDateTimeInLocalTz
              .subtract(const Duration(minutes: 5));
          print(
            "NotificationService: Calculated notificationDateTime (local, 5 mins prior): $notificationDateTimeInLocalTz for ${medicine.name}",
          );

          tz.TZDateTime endDateInLocalTz = tz.TZDateTime.from(
            endDate,
            tz.local,
          );

          if (notificationDateTimeInLocalTz.isAfter(
                tz.TZDateTime.now(tz.local),
              ) &&
              notificationDateTimeInLocalTz.isBefore(endDateInLocalTz)) {
            print(
              "NotificationService: Scheduling notification ID $notificationIdCounter for $medicineName at $notificationDateTimeInLocalTz",
            );

            await flutterLocalNotificationsPlugin.zonedSchedule(
              notificationIdCounter++,
              'Time for your medicine!',
              'Take your $dosageInfo of $medicineName now.',
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
            print(
              "NotificationService: Successfully scheduled notification ID ${notificationIdCounter - 1} for $medicineName at $notificationDateTimeInLocalTz",
            );
          } else {
            print(
              "NotificationService: Skipping schedule for $medicineName at $notificationDateTimeInLocalTz. Reason: " +
                  (notificationDateTimeInLocalTz.isBefore(
                        tz.TZDateTime.now(tz.local),
                      )
                      ? "Time is in the past."
                      : "Time is after end date.") +
                  " Now: ${tz.TZDateTime.now(tz.local)}, EndDate: $endDateInLocalTz",
            );
          }
        } catch (e, s) {
          print(
            "NotificationService: Error scheduling notification for $medicineName at $timeStr on day $day: $e\nStackTrace: $s",
          );
        }
      }
      if (notificationIdCounter > baseId + 500) {
        print(
          "NotificationService: Reached notification scheduling limit (500) for ${medicine.name}. Stopping further scheduling for this medicine.",
        );
        break;
      }
    }
    print(
      "NotificationService: Finished scheduling attempt for ${medicine.name}. Last potential ID: ${notificationIdCounter - 1}. Total scheduled for this run might be less due to past/future checks.",
    );
  }

  Future<void> cancelMedicineNotifications(String medicineId) async {
    int baseId = (medicineId.hashCode % 2000000000).abs();
    int cancellationRange = 550;
    print(
      "NotificationService: Cancelling notifications for medicine ID: $medicineId (Base Notification ID: $baseId, Range: $cancellationRange)",
    );
    for (int i = 0; i < cancellationRange; i++) {
      try {
        await flutterLocalNotificationsPlugin.cancel(baseId + i);
      } catch (e) {
        if (kDebugMode) {
          // print("NotificationService: Minor error cancelling notification ID ${baseId + i} (may not exist): $e");
        }
      }
    }
    print(
      "NotificationService: Finished cancelling potential notifications for medicine ID: $medicineId",
    );
  }

  Future<void> cancelAllNotifications() async {
    print("NotificationService: Cancelling ALL notifications.");
    await flutterLocalNotificationsPlugin.cancelAll();
    print("NotificationService: ALL notifications cancelled.");
  }

  Future<void> checkPendingNotifications() async {
    if (kDebugMode) {
      try {
        final List<PendingNotificationRequest> pendingNotifications =
            await flutterLocalNotificationsPlugin.pendingNotificationRequests();
        print(
          'NotificationService: Number of pending notifications: ${pendingNotifications.length}',
        );
        for (PendingNotificationRequest pnr in pendingNotifications) {
          print(
            'NotificationService: Pending ID: ${pnr.id}, Title: ${pnr.title}, Body: ${pnr.body}, Payload: ${pnr.payload}',
          );
        }
        if (pendingNotifications.isEmpty) {
          print('NotificationService: No pending notifications found.');
        }
      } catch (e) {
        print('NotificationService: Error fetching pending notifications: $e');
      }
    }
  }
}
