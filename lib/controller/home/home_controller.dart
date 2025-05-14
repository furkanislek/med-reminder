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
  // Search query state for name
  var searchQuery = ''.obs;
  var showOnlyActiveMedicines = true.obs;
  var selectedDrugType = ''.obs;

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
        // Sort by nextDoseTime, nulls (completed or far future) at the end
        processedList.sort((a, b) {
          if (a.isCompleted && !b.isCompleted) return 1;
          if (!a.isCompleted && b.isCompleted) return -1;
          if (a.nextDoseTime == null && b.nextDoseTime != null) return 1;
          if (a.nextDoseTime != null && b.nextDoseTime == null) return -1;
          if (a.nextDoseTime == null && b.nextDoseTime == null) return 0;
          return a.nextDoseTime!.compareTo(b.nextDoseTime!);
        });
        return processedList;
      }),
    );

    ever(_allMedicines, (_) => _filterMedicines());
    ever(searchQuery, (_) => _filterMedicines());
    ever(
      selectedDrugType,
      (_) => _filterMedicines(),
    ); // React to drug type changes
    ever(
      showOnlyActiveMedicines,
      (_) => _filterMedicines(),
    ); // Yeni durumu dinle
  }

  // Yeni eklenen metot - İlaç listesini yeniden yükler
  Future<void> refreshMedicines() async {
    try {
      // Stream'den en son verileri almak için zorlama yapıyoruz
      final medicines = await _dataService.getMedicinesStream().first;

      // Alınan verileri işliyoruz
      List<MedicineModel> processedList = [];
      for (var med in medicines) {
        MedicineModel processedMed = _calculateNextDose(med);
        processedList.add(processedMed);
        _notificationService.scheduleMedicineNotifications(processedMed);
      }

      // Sıralama işlemi yapıyoruz
      processedList.sort((a, b) {
        if (a.isCompleted && !b.isCompleted) return 1;
        if (!a.isCompleted && b.isCompleted) return -1;
        if (a.nextDoseTime == null && b.nextDoseTime != null) return 1;
        if (a.nextDoseTime != null && b.nextDoseTime == null) return -1;
        if (a.nextDoseTime == null && b.nextDoseTime == null) return 0;
        return a.nextDoseTime!.compareTo(b.nextDoseTime!);
      });

      // _allMedicines listesini güncelliyoruz
      _allMedicines.assignAll(processedList);

      // UI'da gösterilecek listeyi filtreliyoruz
      _filterMedicines();

      // Controller'ı güncellemek için update çağrısı
      update();
    } catch (e) {
      print("Error refreshing medicines: $e");
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateDrugTypeFilter(String type) {
    selectedDrugType.value = type;
  }

  void _filterMedicines() {
    String query = searchQuery.value.toLowerCase();
    String typeFilter = selectedDrugType.value.toLowerCase();

    List<MedicineModel> tempFilteredList =
        _allMedicines.where((medicine) {
          final nameMatches = medicine.name.toLowerCase().contains(query);
          final typeMatches =
              typeFilter.isEmpty ||
              medicine.type.toLowerCase().contains(typeFilter);
          return nameMatches && typeMatches;
        }).toList();

    filteredMedicines.assignAll(tempFilteredList);
  }

  MedicineModel _calculateNextDose(MedicineModel medicine) {
    DateTime now = DateTime.now();
    DateTime startDate = medicine.startDate.toDate();
    DateTime endDate = startDate.add(Duration(days: medicine.duration));

    if (medicine.duration > 0 && now.isAfter(endDate)) {
      // Check duration only if it's positive
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

        // Consider doses from the start date onwards
        if (doseTimeToday.isAfter(now) && !doseTimeToday.isBefore(startDate)) {
          nextDoseDateTime = doseTimeToday;
          break;
        }
      } catch (e) {
        print("Error parsing dose time: $timeStr - $e");
      }
    }

    // If no dose today, check for tomorrow and subsequent days within duration
    if (nextDoseDateTime == null && medicine.doseHours.isNotEmpty) {
      for (int i = 1; i <= medicine.duration + 1; i++) {
        // Check a bit beyond duration just in case
        DateTime nextDay = DateTime(now.year, now.month, now.day + i);
        if (medicine.duration > 0 &&
            nextDay.isAfter(endDate.add(const Duration(days: 1))))
          break; // Don't go too far beyond end date

        try {
          String firstTimeStr = medicine.doseHours.first;
          List<String> parts = firstTimeStr.split(':');
          int hour = int.parse(parts[0]);
          int minute = int.parse(parts[1]);

          DateTime firstDoseNextDay = DateTime(
            nextDay.year,
            nextDay.month,
            nextDay.day,
            hour,
            minute,
          );

          if (!firstDoseNextDay.isBefore(startDate)) {
            nextDoseDateTime = firstDoseNextDay;
            break;
          }
        } catch (e) {
          print(
            "Error parsing first dose time for day $i: ${medicine.doseHours.first} - $e",
          );
        }
      }
    }

    if (nextDoseDateTime != null &&
        medicine.duration > 0 &&
        nextDoseDateTime.isAfter(endDate)) {
      medicine.isCompleted = true;
      medicine.nextDoseTime = null;
    } else {
      medicine.nextDoseTime = nextDoseDateTime;
    }

    return medicine;
  }

  List<String> getUniqueDrugTypes() {
    final types = _allMedicines.map((m) => m.type).toSet().toList();
    types.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return types;
  }

  void calculateNextDose() {
    final updatedList =
        _allMedicines.map((med) => _calculateNextDose(med)).toList();
    _allMedicines.assignAll(updatedList);
    update();
  }
}
