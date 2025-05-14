import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/models/medicine_model.dart';
import 'package:mr/pages/MedicineDetail/medicine_detail_page.dart'; // Import the detail page
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: 0.3.sh),
            Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
              ),
            ),
          ],
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
    return "${'card.nextDose'.tr} $dayDesc ${DateFormat('h:mm a').format(nextDoseTime)}"; // Localized
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
        return "card.frequency.timesDaily".tr.replaceAll(
          '{count}',
          dosesPerDay.toString(),
        ); // Localized with manual replacement
    }
  }

  @override
  Widget build(BuildContext context) {
    String dosageInfo =
        "${medicine.dosageQuantity} ${medicine.dosageUnit}, ${_getFrequencyText(medicine.dosesPerDay)}";
    String nextDoseText = _formatNextDose(
      medicine.nextDoseTime,
      medicine.isCompleted,
    );

    return Card(
      color: const Color.fromARGB(255, 250, 250, 255),
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        // Added InkWell for tap functionality
        onTap: () {
          Get.to(() => MedicineDetailPage(medicine: medicine));
        },
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      dosageInfo,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      nextDoseText,
                      style: TextStyle(
                        fontSize: 14.sp,
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
              SizedBox(width: 16.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SvgPicture.asset(
                  'assets/svg/${medicine.type.toLowerCase().replaceAll(' ', '_')}.svg',
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                  colorBlendMode:
                      medicine.isCompleted
                          ? BlendMode.saturation
                          : BlendMode.dst,
                  placeholderBuilder:
                      (BuildContext context) => Container(
                        width: 50.w,
                        height: 50.h,
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.medication_outlined,
                          color: Colors.grey[400],
                          size: 30.sp,
                        ),
                      ),
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.medication_liquid,
                          color: Colors.grey[400],
                          size: 30.sp,
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
