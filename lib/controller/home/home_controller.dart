import 'package:get/get.dart';
import 'package:mr/models/medicine_model.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/notification_service.dart'; // Import NotificationService

class HomeController extends GetxController {
  final DataService _dataService = Get.find<DataService>();
  final NotificationService _notificationService =
      Get.find<NotificationService>(); // Find NotificationService

  // Original list fetched from the stream
  final _allMedicines = <MedicineModel>[].obs;
  // Filtered list to be displayed in the UI
  var filteredMedicines = <MedicineModel>[].obs;
  // Search query state
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();

    _notificationService.init();

    _allMedicines.bindStream(
      _dataService.getMedicinesStream().map((medList) {
        List<MedicineModel> processedList = [];
        for (var med in medList) {
          MedicineModel processedMed = _calculateNextDose(med);
          processedList.add(processedMed);
          _notificationService.scheduleMedicineNotifications(processedMed);
        }
        return processedList;
      }),
    );

    ever(_allMedicines, (_) => _filterMedicines());
    ever(searchQuery, (_) => _filterMedicines());
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void _filterMedicines() {
    String query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredMedicines.assignAll(_allMedicines);
    } else {
      filteredMedicines.assignAll(
        _allMedicines.where((medicine) {
          return medicine.name.toLowerCase().contains(query);
        }).toList(),
      );
    }
  }

  MedicineModel _calculateNextDose(MedicineModel medicine) {
    DateTime now = DateTime.now();
    DateTime startDate = medicine.startDate.toDate();
    DateTime endDate = startDate.add(Duration(days: medicine.duration));

    if (now.isAfter(endDate)) {
      medicine.isCompleted = true;
      medicine.nextDoseTime = null; 
      return medicine;
    }

    medicine.isCompleted = false;

    DateTime? nextDoseDateTime;
    medicine.doseHours.sort(); // Ensure hours are sorted HH:mm

    for (String timeStr in medicine.doseHours) {
      try {
        List<String> parts = timeStr.split(':');
        int hour = int.parse(parts[0]);
        int minute = int.parse(parts[1]);

        DateTime doseTimeToday = DateTime(
          now.year,
          now.month,
          now.day,
          hour,
          minute,
        );

        if (doseTimeToday.isAfter(now)) {
          nextDoseDateTime = doseTimeToday;
          break; 
        }
      } catch (e) {
        print("Error parsing dose time: $timeStr - $e");
      }
    }

    if (nextDoseDateTime == null && medicine.doseHours.isNotEmpty) {
      try {
        String firstTimeStr = medicine.doseHours.first;
        List<String> parts = firstTimeStr.split(':');
        int hour = int.parse(parts[0]);
        int minute = int.parse(parts[1]);

        DateTime firstDoseTomorrow = DateTime(
          now.year,
          now.month,
          now.day + 1,
          hour,
          minute,
        );
        nextDoseDateTime = firstDoseTomorrow;
      } catch (e) {
        print(
          "Error parsing first dose time for tomorrow: ${medicine.doseHours.first} - $e",
        );
      }
    }

    if (nextDoseDateTime != null && nextDoseDateTime.isAfter(endDate)) {
      medicine.isCompleted = true;
      medicine.nextDoseTime = null;
    } else {
      medicine.nextDoseTime = nextDoseDateTime;
    }

    return medicine;
  }
}
