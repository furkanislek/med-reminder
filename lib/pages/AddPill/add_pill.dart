import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import for formatting time
import 'package:mr/controller/data/data_service_controller.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/services/data_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import for ScreenUtil

class AddPillScreen extends StatelessWidget {
  AddPillScreen({super.key});
  final DataServiceController controller = Get.find<DataServiceController>();
  final DataService dataService = Get.find<DataService>();
  final HomeController homeController = Get.find<HomeController>();

  final List<List<String>> _categories = [
    ['assets/svg/needle.svg', 'needle'],
    ['assets/svg/pill.svg', 'pill'],
    ['assets/svg/stomach.svg', 'stomach'],
    ['assets/svg/syrup.svg', 'syrup'],
    ['assets/svg/eardrops.svg', 'eardrops'],
    ['assets/svg/nosalspray.svg', 'nosalspray'],
    ['assets/svg/vitamin.svg', 'vitamin'],
  ];

  Future<void> _refreshMedicines() async {
    final homeController = Get.find<HomeController>();
    await homeController.refreshMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            controller.resetForm(); // Reset form on back press

            // HomeController'ı aktif olarak güncelle
            await _refreshMedicines();

            await Future.delayed(const Duration(milliseconds: 200));
            await Get.offAll(Menu());
          },
        ),
        title: Text('addMedicine.addMedicine'.tr),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 10.w),
        child: ElevatedButton(
          onPressed: () async {
            await controller.saveMedicineData();
            if (!Get.isSnackbarOpen) {
              controller.resetForm();

              // HomeController'ı aktif olarak güncelle
              await _refreshMedicines();

              await Future.delayed(const Duration(milliseconds: 200));
              await Get.offAll(Menu());
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0996C7),
            padding: EdgeInsets.symmetric(vertical: 15.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            minimumSize: Size(double.infinity, 50.h),
          ),
          child: Text(
            'addMedicine.save'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'addMedicine.name'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                hint: "addMedicine.addMedicineHint".tr,
                onChanged: (value) => controller.name.value = value,
                keyboardType: TextInputType.text,
                context: context,
              ),
              SizedBox(height: 25.h),

              Text(
                'addMedicine.dosage'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTextField(
                      hint: "addMedicine.dosageHint2".tr,
                      onChanged:
                          (value) =>
                              controller.dosageQuantity.value =
                                  int.tryParse(value) ?? 0,
                      keyboardType: TextInputType.number,
                      context: context,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 2,
                    child: _buildTextField(
                      hint: "addMedicine.dosageUnit".tr,
                      onChanged: (value) => controller.dosageUnit.value = value,
                      keyboardType: TextInputType.text,
                      context: context,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),

              Text(
                'addMedicine.category'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                        right: 15.w,
                        top: 20.h,
                        bottom: 20.h,
                      ),
                      child: Obx(() {
                        final selected =
                            controller.types.value == _categories[index][1];
                        return GestureDetector(
                          onTap:
                              () =>
                                  controller.types.value =
                                      _categories[index][1],
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selected
                                      ? const Color.fromARGB(255, 219, 219, 219)
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2.w,
                                  blurRadius: 5.w,
                                  offset: Offset(3.w, 3.h),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: 45.w,
                              height: 45.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.h,
                                  horizontal: 8.w,
                                ),
                                child: SvgPicture.asset(
                                  _categories[index][0],
                                  width: 40.w,
                                  height: 40.h,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.blue,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              SizedBox(height: 25.h),

              Text(
                'addMedicine.frequency'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showDoseTimesPicker(context),
                      child: _buildPickerContainer(
                        iconAsset: 'assets/svg/clock.svg',
                        child: Obx(
                          () => Text(
                            controller.notifications.isEmpty
                                ? 'addMedicine.selectDoseTimes'.tr
                                : '${controller.notifications.length} ${'addMedicine.times'.tr}',
                            style: TextStyle(
                              color:
                                  controller.notifications.isEmpty
                                      ? Colors.grey
                                      : Colors.black,
                            ),
                          ),
                        ),
                        context: context,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showDurationPicker(context),
                      child: _buildPickerContainer(
                        iconAsset: 'assets/svg/calendar.svg',
                        child: Obx(
                          () => Text(
                            controller.duration.value == 0
                                ? 'addMedicine.selectDuration'.tr
                                : '${controller.duration.value} ${'addMedicine.days'.tr}',
                            style: TextStyle(
                              color:
                                  controller.duration.value == 0
                                      ? Colors.grey
                                      : Colors.black,
                            ),
                          ),
                        ),
                        context: context,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Text(
                'addMedicine.whenToTake'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  _buildWhenToTakeOption(
                    context,
                    label: 'addMedicine.beforeFood'.tr,
                    value: 'Before Food',
                    iconAsset: 'assets/svg/beforedinner.svg',
                  ),
                  SizedBox(width: 12.w),
                  _buildWhenToTakeOption(
                    context,
                    label: 'addMedicine.afterFood'.tr,
                    value: 'After Food',
                    iconAsset: 'assets/svg/afterdinner.svg',
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              Text(
                'addMedicine.notifications'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1.w,
                      blurRadius: 3.w,
                      offset: Offset(0, 1.h),
                    ),
                  ],
                ),
                child: Obx(
                  () => SwitchListTile(
                    title: Text('addMedicine.enableNotifications'.tr),
                    subtitle: Text('addMedicine.receiveNotification'.tr),
                    value: controller.notificationsEnabled.value,
                    onChanged: (bool value) {
                      controller.notificationsEnabled.value = value;
                    },
                    activeColor: Colors.green, // Or theme color
                    secondary: Icon(
                      Icons.notifications_active_outlined,
                      color:
                          controller.notificationsEnabled.value
                              ? Colors.green
                              : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required Function(String) onChanged,
    required BuildContext context,
    TextInputType keyboardType = TextInputType.text,
    int maxLength = 50,
  }) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1.w,
            blurRadius: 3.w,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(fontSize: 14.sp),
        onChanged: onChanged,
        textInputAction: TextInputAction.next, // Change to next
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }

  Widget _buildPickerContainer({
    required String iconAsset,
    required Widget child,
    required BuildContext context,
  }) {
    return Container(
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1.w,
            blurRadius: 3.w,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconAsset,
            width: 18.w,
            height: 18.h,
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
          SizedBox(width: 8.w),
          Expanded(child: child),
          SizedBox(width: 8.w),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 16.sp),
        ],
      ),
    );
  }

  Widget _buildWhenToTakeOption(
    BuildContext context, {
    required String label,
    required String value,
    required String iconAsset,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.withFood.value = value,
        child: Obx(() {
          final isSelected = controller.withFood.value == value;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey.shade300,
              ),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 6.w,
                    offset: Offset(0, 2.h),
                  ),
              ],
            ),
            child: Column(
              children: [
                SvgPicture.asset(iconAsset, height: 50.h),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label, textAlign: TextAlign.center),
                    SizedBox(width: 5.w),
                    Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: isSelected ? Colors.green : Colors.grey,
                      size: 18.sp,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void _showDoseTimesPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: 350.h,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                "addMedicine.doseTimesPickerTitle".tr,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.notifications.length + 1,
                  itemBuilder: (ctx, index) {
                    if (index == controller.notifications.length) {
                      return ListTile(
                        leading: Icon(Icons.add_alarm, size: 16.sp),
                        title: Text("addMedicine.addTime".tr),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            if (!controller.notifications.any(
                              (t) =>
                                  t.hour == selectedTime.hour &&
                                  t.minute == selectedTime.minute,
                            )) {
                              controller.notifications.add(selectedTime);
                              controller.notifications.sort((a, b) {
                                int aTotalMinutes = a.hour * 60 + a.minute;
                                int bTotalMinutes = b.hour * 60 + b.minute;
                                return aTotalMinutes.compareTo(bTotalMinutes);
                              });
                            }
                          }
                        },
                      );
                    }
                    final time = controller.notifications[index];
                    return ListTile(
                      title: Text(
                        DateFormat(
                          'HH:mm',
                        ).format(DateTime(2024, 1, 1, time.hour, time.minute)),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                          size: 16.sp,
                        ),
                        onPressed:
                            () => controller.notifications.removeAt(index),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                width: 336.w, // 75% of 448
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "addMedicine.done".tr,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showDurationPicker(BuildContext context) {
    int tempDuration = controller.duration.value;
    if (tempDuration == 0) tempDuration = 1;

    Get.bottomSheet(
      Container(
        height: 300.h,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                "addMedicine.durationPickerTitle".tr,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50.h,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) => tempDuration = index + 1,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List<Widget>.generate(
                    90,
                    (index) => Center(
                      child: Text(
                        '${index + 1} ${'addMedicine.days'.tr}',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
                controller: FixedExtentScrollController(
                  initialItem: tempDuration > 0 ? tempDuration - 1 : 0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                width: 336.w, // 75% of 448
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 24.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    minimumSize: Size(double.infinity, 45.h),
                  ),
                  child: Text(
                    "addMedicine.done".tr,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                  onPressed: () {
                    controller.duration.value = tempDuration;
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
