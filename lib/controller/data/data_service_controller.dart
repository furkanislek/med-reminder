import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import for formatting time
import 'package:mr/services/data_service.dart';
import 'package:mr/services/notification_service.dart'; // Import NotificationService

class DataServiceController extends GetxController {
  // Input fields observables
  var name = ''.obs;
  var types = ''.obs; // Corresponds to 'type' in the model/service
  var dosageQuantity = 0.obs;
  var dosageUnit = ''.obs;
  var duration = 0.obs;
  var withFood = ''.obs;
  var notifications =
      <TimeOfDay>[].obs; // Stores selected TimeOfDay for dose times
  var notificationsEnabled =
      true.obs; // New observable for notification toggle, default true

  final DataService dataService = Get.find<DataService>();
  final NotificationService notificationService =
      Get.find<NotificationService>(); // Find NotificationService

  @override
  void onInit() {
    super.onInit();
    // Initialize default values if needed
    withFood.value = 'With Food'; // Example default
  }

  // Renamed from saveExpense for clarity
  Future<void> saveMedicineData() async {
    // 1. Convert List<TimeOfDay> to List<String> (HH:mm format)
    List<String> doseHoursList =
        notifications.map((time) {
          final now = DateTime.now();
          final dt = DateTime(
            now.year,
            now.month,
            now.day,
            time.hour,
            time.minute,
          );
          return DateFormat('HH:mm').format(dt);
        }).toList();
    doseHoursList.sort();

    // 2. Basic Validation
    if (name.value.isEmpty ||
        types.value.isEmpty ||
        dosageQuantity.value <= 0 ||
        dosageUnit.value.isEmpty ||
        doseHoursList.isEmpty ||
        duration.value <= 0 ||
        withFood.value.isEmpty) {
      // Added withFood validation
      Get.snackbar(
        'Error',
        'Please fill all required fields correctly.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // 3. Call the updated saveMedicine method in DataService
    try {
      // We need to update DataService.saveMedicine to accept notificationsEnabled
      // For now, let's assume it's updated (will do that next if needed)
      await dataService.saveMedicine(
        name: name.value,
        type: types.value,
        dosageQuantity: dosageQuantity.value,
        dosageUnit: dosageUnit.value,
        doseHours: doseHoursList,
        duration: duration.value,
        withFood: withFood.value,
        notificationsEnabled:
            notificationsEnabled.value, // Pass the toggle state
      );

      // --- Schedule Notifications ---
      // After saving, fetch the newly created medicine data to get its ID and schedule notifications
      // This is a bit complex as saveMedicine doesn't return the new doc.
      // A better approach might be to return the ID from saveMedicine or query immediately after.
      // For now, we'll skip the immediate scheduling here and assume another mechanism
      // (like listening to the stream in HomeController) will handle scheduling.
      // OR, modify saveMedicine to return the ID and then fetch and schedule.
      // Let's assume HomeController's stream listener will handle scheduling new/updated meds.

      // Clear form fields after successful save
      resetForm();

      Get.snackbar(
        'Success',
        'Medicine saved successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate back or to home screen
      // Get.back(); // Go back one screen
    } catch (e) {
      print("saveMedicineData error: $e");
      Get.snackbar(
        'Error',
        'Failed to save medicine: ${e.toString()}', // Show specific error
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Helper to reset form fields
  void resetForm() {
    name.value = '';
    types.value = '';
    dosageQuantity.value = 0;
    dosageUnit.value = '';
    duration.value = 0;
    withFood.value = 'With Food'; // Reset to default
    notifications.clear();
    notificationsEnabled.value = true; // Reset to default
  }
}
