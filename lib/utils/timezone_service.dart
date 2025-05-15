import 'package:flutter/services.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzData;

class TimeZoneService {
  static const MethodChannel _channel = MethodChannel('timezone_channel');

  static Future<void> initializeTimeZone() async {
    tzData.initializeTimeZones();

    try {
      final String timeZoneName = await _channel.invokeMethod(
        'getTimeZoneName',
      );
      final location = tz.getLocation(timeZoneName);
      tz.setLocalLocation(location);
      print('[TimeZoneService] Time zone set to: $timeZoneName');
    } catch (e) {
      print('[TimeZoneService] Error: $e');
      // fallback
      tz.setLocalLocation(tz.getLocation('Europe/Istanbul'));
    }
  }
}
