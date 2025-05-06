import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/models/medicine_model.dart';
import 'package:mr/pages/MedicineDetail/medicine_detail_page.dart'; // Import the detail page

class MedicineListView extends StatelessWidget {
  final HomeController controller;

  const MedicineListView({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.filteredMedicines.isEmpty) {
        bool isSearching = controller.searchQuery.value.isNotEmpty;
        bool isFilteringByType = controller.selectedDrugType.value.isNotEmpty;
        String message;
        if (isSearching && isFilteringByType) {
          message = 'filter.noResultsForSearchAndType'.trParams({
            'query': controller.searchQuery.value,
            'type': controller.selectedDrugType.value,
          });
        } else if (isSearching) {
          message = 'filter.noResultsForSearch'.trParams({
            'query': controller.searchQuery.value,
          });
        } else if (isFilteringByType) {
          message = 'filter.noResultsForType'.trParams({
            'type': controller.selectedDrugType.value,
          });
        } else {
          message = 'home.noMedicines'.tr;
        }
        return Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        );
      }
      // Display the filtered list
      return ListView.builder(
        itemCount: controller.filteredMedicines.length,
        itemBuilder: (context, index) {
          final medicine = controller.filteredMedicines[index];
          return MedicineCard(medicine: medicine);
        },
      );
    });
  }
}

class MedicineCard extends StatelessWidget {
  final MedicineModel medicine;

  const MedicineCard({Key? key, required this.medicine}) : super(key: key);

  String _formatNextDose(DateTime? nextDoseTime, bool isCompleted) {
    if (isCompleted) {
      return "card.treatmentCompleted".tr; // Localized
    }
    if (nextDoseTime == null) {
      return "card.nextDoseN_A".tr; // Localized
    }
    // Check if the next dose is today or tomorrow for more user-friendly text
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final nextDoseDate = DateTime(
      nextDoseTime.year,
      nextDoseTime.month,
      nextDoseTime.day,
    );

    String dayDesc = "";
    if (nextDoseDate == today) {
      dayDesc = "card.todayAt".tr; // Localized
    } else if (nextDoseDate == tomorrow) {
      dayDesc = "card.tomorrowAt".tr; // Localized
    } else {
      dayDesc =
          "${DateFormat.MMMd().format(nextDoseTime)} ${'card.at'.tr} "; // Localized 'at'
    }
    return "${'card.nextDose'.tr} $dayDesc${DateFormat('h:mm a').format(nextDoseTime)}"; // Localized
  }

  String _getFrequencyText(int dosesPerDay) {
    if (dosesPerDay <= 0) return ''; // Handle cases with no doses
    switch (dosesPerDay) {
      case 1:
        return "card.frequency.onceDaily".tr; // Localized
      case 2:
        return "card.frequency.twiceDaily".tr; // Localized
      case 3:
        return "card.frequency.thriceDaily".tr; // Localized
      default:
        return "card.frequency.timesDaily".trParams({
          'count': dosesPerDay.toString(),
        }); // Localized
    }
  }

  @override
  Widget build(BuildContext context) {
    String dosageInfo =
        "${medicine.dosageQuantity}${medicine.dosageUnit}, ${_getFrequencyText(medicine.dosesPerDay)}";
    String nextDoseText = _formatNextDose(
      medicine.nextDoseTime,
      medicine.isCompleted,
    );

    return Card(
      color: const Color.fromARGB(255, 250, 250, 255),
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        // Added InkWell for tap functionality
        onTap: () {
          Get.to(() => MedicineDetailPage(medicine: medicine));
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dosageInfo,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      nextDoseText,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            medicine.isCompleted
                                ? Colors.green
                                : Colors.black87,
                        fontWeight:
                            medicine.isCompleted
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SvgPicture.asset(
                  'assets/svg/${medicine.type.toLowerCase().replaceAll(' ', '_')}.svg', // Sanitize type for asset name
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  // ignore: deprecated_member_use
                  color:
                      medicine.isCompleted
                          ? Colors.grey
                          : null, // Grey out if completed
                  colorBlendMode:
                      medicine.isCompleted
                          ? BlendMode.saturation
                          : BlendMode.dst,
                  placeholderBuilder:
                      (BuildContext context) => Container(
                        width: 50,
                        height: 50,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.medication_outlined,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                      ),
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(
                          Icons.medication_liquid,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
