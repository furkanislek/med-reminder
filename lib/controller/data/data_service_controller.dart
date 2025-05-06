import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import for formatting time
import 'package:mr/models/medicine_model.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/notification_service.dart'; // Import NotificationService

class DataServiceController extends GetxController {
  // Input fields observables
  var name = ''.obs;
  var types = ''.obs; // This observable name can remain, but when interacting with MedicineModel, use 'type'
  var dosageQuantity = 0.obs;
  var dosageUnit = ''.obs;
  var duration = 0.obs;
  var withFood = ''.obs;
  var notifications = <TimeOfDay>[].obs; // Stores selected TimeOfDay for dose times
  var notificationsEnabled = true.obs; // New observable for notification toggle, default true

  final DataService dataService = Get.find<DataService>();
  final NotificationService notificationService = Get.find<NotificationService>(); // Find NotificationService

  @override
  void onInit() {
    super.onInit();
    // Initialize default values if needed
    withFood.value = 'With Food'; // Example default
  }

  // Method to populate form for updating an existing medicine
  void loadMedicineForUpdate(MedicineModel medicine) {
    name.value = medicine.name;
    types.value = medicine.type; // Corrected: medicine.type
    dosageQuantity.value = medicine.dosageQuantity; // Corrected: medicine.dosageQuantity
    dosageUnit.value = medicine.dosageUnit; // Corrected: medicine.dosageUnit
    duration.value = medicine.duration;
    withFood.value = medicine.withFood;
    notificationsEnabled.value = medicine.notificationsEnabled;
    notifications.assignAll(medicine.doseHours.map((timeStr) {
      final parts = timeStr.split(':');
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    }).toList());
  }

  Future<void> saveMedicineData() async {
    List<String> doseHoursList = notifications.map((time) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      return DateFormat('HH:mm').format(dt);
    }).toList();
    doseHoursList.sort();

    if (name.value.isEmpty ||
        types.value.isEmpty || // This refers to the observable, which is fine
        dosageQuantity.value <= 0 ||
        dosageUnit.value.isEmpty ||
        doseHoursList.isEmpty ||
        duration.value <= 0 ||
        withFood.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields correctly.',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      await dataService.saveMedicine(
        name: name.value,
        type: types.value, // This is passed to DataService, which expects 'type'
        dosageQuantity: dosageQuantity.value,
        dosageUnit: dosageUnit.value,
        doseHours: doseHoursList,
        duration: duration.value,
        withFood: withFood.value,
        notificationsEnabled: notificationsEnabled.value,
      );
      resetForm();
      Get.snackbar('Success', 'Medicine saved successfully!',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      print("saveMedicineData error: $e");
      Get.snackbar('Error', 'Failed to save medicine: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> updateMedicineData(String medicineId) async {
    List<String> doseHoursList = notifications.map((time) {
      final now = DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      return DateFormat('HH:mm').format(dt);
    }).toList();
    doseHoursList.sort();

    if (name.value.isEmpty ||
        types.value.isEmpty || // Observable name
        dosageQuantity.value <= 0 ||
        dosageUnit.value.isEmpty ||
        doseHoursList.isEmpty ||
        duration.value <= 0 ||
        withFood.value.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields correctly for update.',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    try {
      await dataService.updateMedicine(
        medicineId: medicineId,
        name: name.value,
        type: types.value, // Pass observable value, DataService expects 'type'
        dosageQuantity: dosageQuantity.value,
        dosageUnit: dosageUnit.value,
        doseHours: doseHoursList,
        duration: duration.value,
        withFood: withFood.value,
        notificationsEnabled: notificationsEnabled.value,
      );
      Get.back(); // Go back after successful update
      Get.snackbar('Success', 'Medicine updated successfully!',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      print("updateMedicineData error for $medicineId: $e");
      Get.snackbar('Error', 'Failed to update medicine: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void resetForm() {
    name.value = '';
    types.value = '';
    dosageQuantity.value = 0;
    dosageUnit.value = '';
    duration.value = 0;
    withFood.value = 'With Food';
    notifications.clear();
    notificationsEnabled.value = true;
  }
}

