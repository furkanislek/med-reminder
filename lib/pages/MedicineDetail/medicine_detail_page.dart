import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mr/models/medicine_model.dart';
import 'package:mr/controller/data/data_service_controller.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'package:mr/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineDetailPage extends StatefulWidget {
  final MedicineModel medicine;

  const MedicineDetailPage({super.key, required this.medicine});

  @override
  State<MedicineDetailPage> createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  final DataServiceController _dataServiceController =
      Get.find<DataServiceController>();
  final NotificationService _notificationService =
      Get.find<NotificationService>();

  late TextEditingController _nameController;
  late TextEditingController _dosageQuantityController;
  late TextEditingController _dosageUnitController;
  late DateTime _selectedStartDate;

  final List<List<String>> _categories = [
    ['assets/svg/needle.svg', 'needle'],
    ['assets/svg/pill.svg', 'pill'],
    ['assets/svg/stomach.svg', 'stomach'],
    ['assets/svg/syrup.svg', 'syrup'],
    ['assets/svg/eardrops.svg', 'eardrops'],
    ['assets/svg/nosalspray.svg', 'nosalspray'],
    ['assets/svg/vitamin.svg', 'vitamin'],
  ];

  @override
  void initState() {
    super.initState();
    _dataServiceController.loadMedicineForUpdate(widget.medicine);
    _nameController = TextEditingController(
      text: _dataServiceController.name.value,
    );
    _dosageQuantityController = TextEditingController(
      text:
          _dataServiceController.dosageQuantity.value > 0
              ? _dataServiceController.dosageQuantity.value.toString()
              : '',
    );
    _dosageUnitController = TextEditingController(
      text: _dataServiceController.dosageUnit.value,
    );
    _selectedStartDate = widget.medicine.startDate.toDate();

    _nameController.addListener(() {
      _dataServiceController.name.value = _nameController.text;
    });
    _dosageQuantityController.addListener(() {
      _dataServiceController.dosageQuantity.value =
          int.tryParse(_dosageQuantityController.text) ?? 0;
    });
    _dosageUnitController.addListener(() {
      _dataServiceController.dosageUnit.value = _dosageUnitController.text;
    });
  }

  void _updateMedicine() async {
    if (_dataServiceController.name.value.isEmpty ||
        _dataServiceController.dosageQuantity.value <= 0 ||
        _dataServiceController.dosageUnit.value.isEmpty ||
        _dataServiceController.types.value.isEmpty ||
        _dataServiceController.notifications.isEmpty ||
        _dataServiceController.duration.value <= 0) {
      Get.snackbar(
        'general.error'.tr,
        'medicine.errorAllFields'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      // Ensuring the correct method name is called
      await _dataServiceController.updateMedicineData(widget.medicine.id);

      List<String> doseHoursStrings =
          _dataServiceController.notifications
              .map(
                (time) =>
                    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
              )
              .toList();
      doseHoursStrings.sort();
      MedicineModel updatedMedicineForNotification = MedicineModel(
        id: widget.medicine.id,
        name: _dataServiceController.name.value,
        type: _dataServiceController.types.value,
        dosesPerDay: doseHoursStrings.length,
        doseHours: doseHoursStrings,
        dosageQuantity: _dataServiceController.dosageQuantity.value,
        dosageUnit: _dataServiceController.dosageUnit.value,
        duration: _dataServiceController.duration.value,
        withFood: _dataServiceController.withFood.value,
        startDate: Timestamp.fromDate(_selectedStartDate),
        notificationsEnabled: _dataServiceController.notificationsEnabled.value,
      );

      await _notificationService.cancelMedicineNotifications(
        widget.medicine.id,
      );
      _notificationService.scheduleMedicineNotifications(
        updatedMedicineForNotification,
      );

      // İşlem tamamlandıktan sonra formu sıfırla
      _dataServiceController.resetForm();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
          onPressed: () {
            _dataServiceController.resetForm();
            Get.back();
          },
        ),
        title: Text(
          'addMedicine.titleEdit'.tr,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      bottomNavigationBar: Container(
        // Delete Button
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
        child: ElevatedButton(
          onPressed: _updateMedicine,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0996C7),
            padding: EdgeInsets.symmetric(vertical: 15.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            minimumSize: Size(double.infinity, 50.h),
          ),
          child: Text(
            'general.save'.tr,
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
                'addMedicine.nameLabel'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              _buildTextField(
                controller: _nameController,
                hint: "Medicine Name (e.g., Paracetamol)",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 25.h),
              Text(
                'addMedicine.dosageLabel'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTextField(
                      controller: _dosageQuantityController,
                      hint: "Quantity (e.g., 500)",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 1,
                    child: _buildTextField(
                      controller: _dosageUnitController,
                      hint: "Unit (e.g., mg)",
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Text(
                'addMedicine.typeLabel'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
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
                            _dataServiceController.types.value ==
                            _categories[index][1];
                        return GestureDetector(
                          onTap:
                              () =>
                                  _dataServiceController.types.value =
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
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(3, 3),
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: 45.w,
                              height: 45.h,
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
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
                'addMedicine.frequencyDurationLabel'.tr,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showDoseTimesPicker(context),
                      child: _buildPickerContainer(
                        iconAsset: 'assets/svg/timer.svg',
                        child: Obx(
                          () => Text(
                            _dataServiceController.notifications.isEmpty
                                ? 'addMedicine.selectDoseTimes'.tr
                                : '${_dataServiceController.notifications.length} ${'addMedicine.timesSelected'.tr}',
                            style: TextStyle(
                              color:
                                  _dataServiceController.notifications.isEmpty
                                      ? Colors.grey
                                      : Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
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
                            _dataServiceController.duration.value == 0
                                ? 'addMedicine.selectDuration'.tr
                                : '${_dataServiceController.duration.value} ${'addMedicine.days'.tr}',
                            style: TextStyle(
                              color:
                                  _dataServiceController.duration.value == 0
                                      ? Colors.grey
                                      : Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              Text(
                'addMedicine.whenToTakeLabel'.tr,
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
                'addMedicine.notificationsLabel'.tr,
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
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Obx(
                  () => SwitchListTile(
                    title: Text(
                      'addMedicine.enableDoseReminders'.tr,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    subtitle: Text(
                      'addMedicine.remindersSubtext'.tr,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    value: _dataServiceController.notificationsEnabled.value,
                    onChanged:
                        (bool value) =>
                            _dataServiceController.notificationsEnabled.value =
                                value,
                    activeColor: Colors.green,
                    secondary: Icon(
                      Icons.notifications_active_outlined,
                      color:
                          _dataServiceController.notificationsEnabled.value
                              ? Colors.green
                              : Colors.grey,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () async {
                  await _dataServiceController.deleteMedicineData(
                    widget.medicine.id,
                  );
                  // Formdaki değerleri temizle
                  _dataServiceController.resetForm();
                  // GetX navigasyon kullanarak sayfa değişimi
                  Get.offAll(() => Menu());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  minimumSize: Size(double.infinity, 50.h),
                ),
                child: Text(
                  'addMedicine.deleteMedicine'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLength = 50,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        maxLength: maxLength,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14.sp),
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }

  Widget _buildPickerContainer({
    required String iconAsset,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
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
          Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.sp),
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
        onTap: () => _dataServiceController.withFood.value = value,
        child: Obx(() {
          final isSelected = _dataServiceController.withFood.value == value;
          return Container(
            padding: EdgeInsets.all(12.r),
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
                    blurRadius: 6,
                    offset: const Offset(0, 2),
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
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.sp),
                    ),
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
    List<TimeOfDay> tempTimes = List.from(_dataServiceController.notifications);
    Get.bottomSheet(
      Container(
        height: 350.h,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Text(
                'addMedicine.selectDoseTimes'.tr,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tempTimes.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(
                      tempTimes[index].format(context),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 20.sp,
                      ),
                      onPressed: () async {
                        tempTimes.removeAt(index);

                        // Eğer tüm saatler silindiyse uyarı göster
                        if (tempTimes.isEmpty) {
                          Get.snackbar(
                            'general.warning'.tr,
                            'medicine.errorNeedTime'.tr,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.amber,
                            colorText: Colors.white,
                          );
                        }

                        _dataServiceController.notifications.assignAll(
                          tempTimes,
                        );

                        Get.back();
                        if (tempTimes.isNotEmpty) {
                          _showDoseTimesPicker(context);
                        }
                      },
                    ),
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: tempTimes[index],
                      );
                      if (picked != null) {
                        tempTimes[index] = picked;

                        // Güncel saatleri controller'a atama
                        _dataServiceController.notifications.assignAll(
                          tempTimes,
                        );

                        Get.back();
                        _showDoseTimesPicker(context);
                      }
                    },
                  );
                },
              ),
            ),
            TextButton.icon(
              icon: Icon(Icons.add_alarm, size: 20.sp),
              label: Text(
                'addMedicine.addTime'.tr,
                style: TextStyle(fontSize: 14.sp),
              ),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  tempTimes.add(picked);

                  // Güncel saatleri controller'a atama
                  _dataServiceController.notifications.assignAll(tempTimes);

                  Get.back();
                  _showDoseTimesPicker(context);
                }
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: ElevatedButton(
                child: Text(
                  'general.done'.tr,
                  style: TextStyle(fontSize: 14.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {
                  tempTimes.sort(
                    (a, b) => (a.hour * 60 + a.minute).compareTo(
                      b.hour * 60 + b.minute,
                    ),
                  );
                  _dataServiceController.notifications.assignAll(tempTimes);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showDurationPicker(BuildContext context) {
    int tempDuration = _dataServiceController.duration.value;
    Get.bottomSheet(
      Container(
        height: 300.h,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Text(
                'addMedicine.selectDuration'.tr,
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
                        style: TextStyle(fontSize: 14.sp),
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
              padding: EdgeInsets.all(8.r),
              child: ElevatedButton(
                child: Text(
                  'general.done'.tr,
                  style: TextStyle(fontSize: 14.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {
                  _dataServiceController.duration.value = tempDuration;
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageQuantityController.dispose();
    _dosageUnitController.dispose();
    super.dispose();
  }
}
