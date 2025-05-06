import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:mr/models/medicine_model.dart';

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

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        );

    final DarwinInitializationSettings
    initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) async {
        final String? payload = notificationResponse.payload;
        if (payload != null) {
          print('Notification payload: $payload');
        }
      },
    );

    _requestPermissions();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestExactAlarmsPermission();

  }

  Future<void> scheduleMedicineNotifications(MedicineModel medicine) async {
    await cancelMedicineNotifications(medicine.id);

    if (!medicine.notificationsEnabled || medicine.isCompleted) {
      print(
        "Notifications disabled or medicine completed for ${medicine.name}",
      );
      return;
    }

    final DateTime startDate = medicine.startDate.toDate();
    final DateTime endDate = startDate.add(Duration(days: medicine.duration));
    final String medicineName = medicine.name;
    final String dosageInfo =
        "${medicine.dosageQuantity}${medicine.dosageUnit}";

    int baseId =
        (medicine.id.hashCode % 2000000000).abs(); 
    int notificationIdCounter = baseId;

    print(
      "Scheduling notifications for ${medicine.name} (ID: ${medicine.id}, Base Notification ID: $baseId)",
    );

    for (int day = 0; day < medicine.duration; day++) {
      DateTime currentDay = startDate.add(Duration(days: day));

      for (String timeStr in medicine.doseHours) {
        try {
          List<String> parts = timeStr.split(':');
          int hour = int.parse(parts[0]);
          int minute = int.parse(parts[1]);

          DateTime doseDateTime = DateTime(
            currentDay.year,
            currentDay.month,
            currentDay.day,
            hour,
            minute,
          );
          DateTime notificationDateTime = doseDateTime.subtract(
            Duration(minutes: 5),
          );

          if (notificationDateTime.isAfter(DateTime.now()) &&
              notificationDateTime.isBefore(endDate)) {
            final tz.TZDateTime scheduledDate = tz.TZDateTime.from(
              notificationDateTime,
              tz.local,
            );

            if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
              print(
                "Skipping past schedule time: $scheduledDate for ${medicine.name}",
              );
              continue;
            }

            await flutterLocalNotificationsPlugin.zonedSchedule(
              notificationIdCounter++, 
              'Time for your medicine!',
              'Take your $dosageInfo of $medicineName now.',
              scheduledDate,
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
              matchDateTimeComponents:
                  DateTimeComponents.dateAndTime, 
              payload: 'medicineId=${medicine.id}',
            );
          }
        } catch (e) {
          print(
            "Error scheduling notification for $medicineName at $timeStr on day $day: $e",
          );
        }
      }
      if (notificationIdCounter > baseId + 500) {
        print("Reached notification scheduling limit for ${medicine.name}");
        break;
      }
    }
    print(
      "Finished scheduling notifications for ${medicine.name} up to $endDate. Last ID: $notificationIdCounter",
    );
  }

  Future<void> cancelMedicineNotifications(String medicineId) async {
    int baseId = (medicineId.hashCode % 2000000000).abs();
    int maxPossibleNotifications = 366 * 12; 

    print(
      "Cancelling notifications for medicine ID: $medicineId (Base Notification ID: $baseId)",
    );
    for (int i = 0; i < maxPossibleNotifications; i++) {
      try {
        await flutterLocalNotificationsPlugin.cancel(baseId + i);
      } catch (e) {
      }
    }
    print(
      "Finished cancelling potential notifications for medicine ID: $medicineId",
    );

  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    print("Cancelled ALL notifications.");
  }
}

