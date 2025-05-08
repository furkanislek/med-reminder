import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import for formatting time
import 'package:mr/models/medicine_model.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/notification_service.dart'; // Import NotificationService

class DataServiceController extends GetxController {

  var name = ''.obs;
  var types =
      ''.obs; 
  var dosageQuantity = 0.obs;
  var dosageUnit = ''.obs;
  var duration = 0.obs;
  var withFood = ''.obs;
  var notifications =
      <TimeOfDay>[].obs; 
  var notificationsEnabled =
      true.obs; 

  final DataService dataService = Get.find<DataService>();
  final NotificationService notificationService =
      Get.find<NotificationService>(); 

  @override
  void onInit() {
    super.onInit();
    withFood.value = 'medicine.withFood'.tr; 
  }

  void loadMedicineForUpdate(MedicineModel medicine) {
    name.value = medicine.name;
    types.value = medicine.type; 
    dosageQuantity.value = medicine.dosageQuantity; 
    dosageUnit.value = medicine.dosageUnit; 
    duration.value = medicine.duration;
    withFood.value = medicine.withFood;
    notificationsEnabled.value = medicine.notificationsEnabled;
    notifications.assignAll(
      medicine.doseHours.map((timeStr) {
        final parts = timeStr.split(':');
        return TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }).toList(),
    );
  }

  Future<void> saveMedicineData() async {
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

    if (name.value.isEmpty ||
        types.value.isEmpty ||
        dosageQuantity.value <= 0 ||
        dosageUnit.value.isEmpty ||
        doseHoursList.isEmpty ||
        duration.value <= 0 ||
        withFood.value.isEmpty) {
      Get.snackbar(
        'medicine.saveMedicineError'.tr,
        'medicine.saveMedicineErrorMessage'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await dataService.saveMedicine(
        name: name.value,
        type:
            types.value,
        dosageQuantity: dosageQuantity.value,
        dosageUnit: dosageUnit.value,
        doseHours: doseHoursList,
        duration: duration.value,
        withFood: withFood.value,
        notificationsEnabled: notificationsEnabled.value,
      );
      Get.snackbar(
        'medicine.saveMedicineSuccess'.tr,
        'medicine.saveMedicineSuccessMessage'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'medicine.saveMedicineError'.tr,
        'medicine.saveMedicineErrorMessage'.tr.replaceAll('{e}', e.toString()),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> updateMedicineData(String medicineId) async {
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

    if (name.value.isEmpty ||
        types.value.isEmpty ||
        dosageQuantity.value <= 0 ||
        dosageUnit.value.isEmpty ||
        doseHoursList.isEmpty ||
        duration.value <= 0 ||
        withFood.value.isEmpty) {
      Get.snackbar(
        'medicine.updateMedicineError'.tr,
        'medicine.updateMedicineErrorMessage'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await dataService.updateMedicine(
        medicineId: medicineId,
        name: name.value,
        type: types.value,
        dosageQuantity: dosageQuantity.value,
        dosageUnit: dosageUnit.value,
        doseHours: doseHoursList,
        duration: duration.value,
        withFood: withFood.value,
        notificationsEnabled: notificationsEnabled.value,
      );
      resetForm();
      Get.back();
      Get.snackbar(
        'medicine.updateMedicineSuccess'.tr,
        'medicine.updateMedicineSuccessMessage'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'medicine.updateMedicineError'.tr,
        'medicine.updateMedicineErrorMessage'.tr.replaceAll('{e}', e.toString())  ,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> deleteMedicineData(String medicineId) async {
    try {
      await dataService.deleteMedicine(medicineId);
      await notificationService.cancelMedicineNotifications(medicineId);
      Get.snackbar(
        'medicine.deleteMedicineSuccess'.tr,
        'medicine.deleteMedicineSuccessMessage'.tr,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'medicine.deleteMedicineError'.tr,
        'medicine.deleteMedicineErrorMessage'.tr.replaceAll('{e}', e.toString()),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resetForm() {
    name.value = '';
    types.value = '';
    dosageQuantity.value = 0;
    dosageUnit.value = '';
    duration.value = 0;
    withFood.value = 'medicine.withFood'.tr;
    notifications.clear();
    notificationsEnabled.value = true;
  }
}
