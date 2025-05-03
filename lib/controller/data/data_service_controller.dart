import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/services.dart';

class DataServiceController extends GetxController {
  var name = ''.obs;
  var doseTimes = ''.obs;
  var types = ''.obs;
  var duration = 0.obs;
  var withFood = ''.obs;
  var notifications = <TimeOfDay>[].obs;
  var whenTime = ''.obs;
  var durationLabel = ''.obs;

  final Auth authService = Auth();
  final DataService dataService = DataService();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveExpense() async {
    List<Timestamp> fireNotifList =
        notifications.map((time) {
          final now = DateTime.now();
          final dateTime = DateTime(
            now.year,
            now.month,
            now.day,
            time.hour,
            time.minute,
          );
          return Timestamp.fromDate(dateTime);
        }).toList();

    await dataService.saveMedicines(
      name: name.value,
      doseTimes: doseTimes.value,
      types: types.value,
      duration: duration.value,
      withFood: withFood.value,
      notifications: fireNotifList,
      whenTime: whenTime.value,
    );
  }
}
