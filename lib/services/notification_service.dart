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
    try {
      final String currentTimeZone = await tz.local.name;
      print("NotificationService: Current timezone: $currentTimeZone");
    } catch (e) {
      print("NotificationService: Error fetching local timezone name: $e");
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
          '@mipmap/ic_launcher', // Ensure this icon exists
        );

    final DarwinInitializationSettings
    initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: false, // Permissions will be requested explicitly
      requestBadgePermission: false,
      requestSoundPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification, // Removed due to user-reported error in original code
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
          // Handle notification tap, e.g., navigate to a specific screen
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

  Future<void> _requestPermissions() async {
    print("NotificationService: Requesting permissions...");
    if (Platform.isIOS) {
      final bool? result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      print("NotificationService: iOS permission request result: $result");
      if (result == false) {
        print(
          "NotificationService: WARNING - iOS notification permissions denied.",
        );
      }
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      // Request notification permission (POST_NOTIFICATIONS for Android 13+)
      bool? notificationPermissionGranted;
      try {
        notificationPermissionGranted =
            await androidImplementation?.requestNotificationsPermission();
        print(
          "NotificationService: Android notification permission request result: $notificationPermissionGranted",
        );
        if (notificationPermissionGranted == false) {
          print(
            "NotificationService: CRITICAL - Android notification permission denied by user.",
          );
        }
      } catch (e) {
        print(
          "NotificationService: Error requesting notification permission: $e",
        );
      }

      // Request exact alarm permission (SCHEDULE_EXACT_ALARM / USE_EXACT_ALARM)
      // This is crucial for reliable timed notifications, especially on Android 12+
      bool? exactAlarmPermissionGranted;
      try {
        exactAlarmPermissionGranted =
            await androidImplementation?.requestExactAlarmsPermission();
        print(
          "NotificationService: Android exact alarm permission request result: $exactAlarmPermissionGranted",
        );
        if (exactAlarmPermissionGranted == false) {
          print(
            "NotificationService: WARNING - Android exact alarm permission may not be granted. This can severely affect scheduled notifications. User might need to grant it manually in app settings.",
          );
        }
      } catch (e) {
        print(
          "NotificationService: Error requesting exact alarm permission: $e",
        );
      }

      if (notificationPermissionGranted == false ||
          exactAlarmPermissionGranted == false) {
        print(
          "NotificationService: One or more critical permissions denied or not fully granted on Android. Notifications may not work reliably.",
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

    await cancelMedicineNotifications(
      medicine.id.toString(),
    ); // Ensure medicine.id is string

    if (!medicine.notificationsEnabled || medicine.isCompleted) {
      print(
        "NotificationService: Notifications disabled or medicine completed for ${medicine.name}. Skipping scheduling.",
      );
      return;
    }

    final DateTime startDateFromModel = medicine.startDate.toDate();
    print(
      "NotificationService: Medicine start date (from model, potentially UTC): $startDateFromModel",
    );
    final DateTime endDate = startDateFromModel.add(
      Duration(days: medicine.duration),
    );
    print("NotificationService: Medicine end date (calculated): $endDate");

    final String medicineName = medicine.name;
    final String dosageInfo =
        "${medicine.dosageQuantity} ${medicine.dosageUnit}";

    String medIdStr =
        medicine.id is String ? medicine.id : medicine.id.toString();
    int baseId = (medIdStr.hashCode % 2000000000).abs();
    int notificationIdCounter = baseId;

    print(
      "NotificationService: Scheduling for ${medicine.name} (ID: ${medicine.id}, Base Notification ID: $baseId). StartDate (model): $startDateFromModel",
    );

    for (int day = 0; day < medicine.duration; day++) {
      DateTime currentDayBase = startDateFromModel.add(Duration(days: day));

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
          tz.TZDateTime nowInLocalTz = tz.TZDateTime.now(tz.local);

          if (notificationDateTimeInLocalTz.isAfter(nowInLocalTz) &&
              notificationDateTimeInLocalTz.isBefore(endDateInLocalTz)) {
            print(
              "NotificationService: Scheduling notification ID $notificationIdCounter for $medicineName at $notificationDateTimeInLocalTz (Device local time)",
            );
            try {
              await flutterLocalNotificationsPlugin.zonedSchedule(
                notificationIdCounter,
                'Time for your medicine!',
                'Take your $dosageInfo of $medicineName now. $endDateInLocalTz $notificationDateTimeInLocalTz',
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
                "NotificationService: Successfully scheduled notification ID $notificationIdCounter for $medicineName at $notificationDateTimeInLocalTz",
              );
            } catch (e) {
              print(
                "NotificationService: ERROR scheduling notification ID $notificationIdCounter for $medicineName. Error: $e",
              );
            }
            notificationIdCounter++;
          } else {
            print(
              "NotificationService: SKIPPING notification ID $notificationIdCounter for $medicineName. Calculated time $notificationDateTimeInLocalTz is in the past ($nowInLocalTz) or after medicine end date $endDateInLocalTz.",
            );
          }
        } catch (e) {
          print(
            "NotificationService: Error processing dose time $timeStr for ${medicine.name} on day $day. Error: $e. Skipping this dose.",
          );
        }
      }
    }
    print(
      "NotificationService: Finished scheduling attempts for ${medicine.name}.",
    );
  }

  Future<void> cancelMedicineNotifications(String medicineId) async {
    print(
      "NotificationService: Attempting to cancel notifications for medicine ID: $medicineId",
    );
    String medIdStr =
        medicineId; // Already ensured it's a string in scheduleMedicineNotifications
    int baseId = (medIdStr.hashCode % 2000000000).abs();
    int maxNotificationsToCancel = 200;
    int cancelledCount = 0;
    for (int i = 0; i < maxNotificationsToCancel; i++) {
      try {
        await flutterLocalNotificationsPlugin.cancel(baseId + i);
        cancelledCount++;
      } catch (e) {
        // print("NotificationService: Error cancelling notification ID ${baseId + i}: $e");
      }
    }
    print(
      "NotificationService: Attempted to cancel $cancelledCount notifications starting from base ID $baseId for medicine ID: $medicineId. Some IDs may not have existed.",
    );
  }

  Future<void> cancelAllNotifications() async {
    print("NotificationService: Cancelling all scheduled notifications.");
    try {
      await flutterLocalNotificationsPlugin.cancelAll();
      print("NotificationService: All notifications cancelled successfully.");
    } catch (e) {
      print("NotificationService: Error cancelling all notifications: $e");
    }
  }

  // Added method to address the build error
  Future<void> checkPendingNotifications() async {
    print("NotificationService: Checking pending notification requests...");
    try {
      final List<PendingNotificationRequest> pendingRequests =
          await flutterLocalNotificationsPlugin.pendingNotificationRequests();
      if (pendingRequests.isEmpty) {
        print("NotificationService: No pending notification requests.");
      } else {
        print(
          "NotificationService: Found ${pendingRequests.length} pending notification(s):",
        );
        for (PendingNotificationRequest request in pendingRequests) {
          print(
            "  ID: ${request.id}, Title: ${request.title}, Body: ${request.body}, Payload: ${request.payload}",
          );
        }
      }
    } catch (e) {
      print("NotificationService: Error checking pending notifications: $e");
    }
  }
}
