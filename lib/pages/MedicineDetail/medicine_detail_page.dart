import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mr/models/medicine_model.dart';
import 'package:mr/controller/data/data_service_controller.dart';
import 'package:mr/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineDetailPage extends StatefulWidget {
  final MedicineModel medicine;

  const MedicineDetailPage({super.key, required this.medicine});

  @override
  State<MedicineDetailPage> createState() => _MedicineDetailPageState();
}

class _MedicineDetailPageState extends State<MedicineDetailPage> {
  final DataServiceController _dataServiceController = Get.find<DataServiceController>();
  final NotificationService _notificationService = Get.find<NotificationService>();

  late TextEditingController _nameController;
  late TextEditingController _dosageQuantityController;
  late TextEditingController _dosageUnitController;
  late DateTime _selectedStartDate;

  final List<List<String>> _categories = [
    ['assets/svg/eardrops.svg', 'eardrops'],
    ['assets/svg/heartmedicine.svg', 'heartmedicine'],
    ['assets/svg/migraine.svg', 'migraine'],
    ['assets/svg/needle.svg', 'needle'],
    ['assets/svg/stomach.svg', 'stomach'],
    ['assets/svg/syrup.svg', 'syrup'],
    ['assets/svg/vitamin.svg', 'vitamin'],
  ];

  @override
  void initState() {
    super.initState();
    _dataServiceController.loadMedicineForUpdate(widget.medicine);
    _nameController = TextEditingController(text: _dataServiceController.name.value);
    _dosageQuantityController = TextEditingController(text: _dataServiceController.dosageQuantity.value > 0 ? _dataServiceController.dosageQuantity.value.toString() : '');
    _dosageUnitController = TextEditingController(text: _dataServiceController.dosageUnit.value);
    _selectedStartDate = widget.medicine.startDate.toDate();

    _nameController.addListener(() {
      _dataServiceController.name.value = _nameController.text;
    });
    _dosageQuantityController.addListener(() {
      _dataServiceController.dosageQuantity.value = int.tryParse(_dosageQuantityController.text) ?? 0;
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

      List<String> doseHoursStrings = _dataServiceController.notifications.map((time) => '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}').toList();
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
          notificationsEnabled: _dataServiceController.notificationsEnabled.value);

      await _notificationService.cancelMedicineNotifications(widget.medicine.id);
      _notificationService.scheduleMedicineNotifications(updatedMedicineForNotification);
      
    } catch (e) {
      print("Error in _updateMedicine UI (MedicineDetailPage): $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            _dataServiceController.resetForm();
            Get.back();
          },
        ),
        title: Text('addMedicine.titleEdit'.tr, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0.5,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: ElevatedButton(
          onPressed: _updateMedicine,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0996C7),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: Text(
            'general.save'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('addMedicine.nameLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _nameController,
              hint: "Medicine Name (e.g., Paracetamol)",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 25),
            Text('addMedicine.dosageLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
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
                const SizedBox(width: 10),
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
            const SizedBox(height: 25),
            Text('addMedicine.typeLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0, right: 15.0, top: 20, bottom: 20),
                    child: Obx(() {
                      final selected = _dataServiceController.types.value == _categories[index][1];
                      return GestureDetector(
                        onTap: () => _dataServiceController.types.value = _categories[index][1],
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selected ? const Color.fromARGB(255, 219, 219, 219) : Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 2, blurRadius: 5, offset: const Offset(3, 3))],
                          ),
                          child: SizedBox(
                            width: 45, height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(_categories[index][0], width: 40, height: 40, colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn)),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            Text('addMedicine.frequencyDurationLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showDoseTimesPicker(context),
                    child: _buildPickerContainer(
                      iconAsset: 'assets/svg/timer.svg',
                      child: Obx(() => Text(
                            _dataServiceController.notifications.isEmpty ? 'addMedicine.selectDoseTimes'.tr : '${_dataServiceController.notifications.length} ${'addMedicine.timesSelected'.tr}',
                            style: TextStyle(color: _dataServiceController.notifications.isEmpty ? Colors.grey : Colors.black),
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showDurationPicker(context),
                    child: _buildPickerContainer(
                      iconAsset: 'assets/svg/calendar.svg',
                      child: Obx(() => Text(
                            _dataServiceController.duration.value == 0 ? 'addMedicine.selectDuration'.tr : '${_dataServiceController.duration.value} ${'addMedicine.days'.tr}',
                            style: TextStyle(color: _dataServiceController.duration.value == 0 ? Colors.grey : Colors.black),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('addMedicine.startDateLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectStartDate(context),
              child: _buildPickerContainer(
                iconAsset: 'assets/svg/calendar.svg',
                child: Text(
                  DateFormat.yMMMd().format(_selectedStartDate),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('addMedicine.whenToTakeLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildWhenToTakeOption(context, label: 'addMedicine.beforeFood'.tr, value: 'Before Food', iconAsset: 'assets/svg/beforedinner.svg'),
                const SizedBox(width: 12),
                _buildWhenToTakeOption(context, label: 'addMedicine.afterFood'.tr, value: 'After Food', iconAsset: 'assets/svg/afterdinner.svg'),
              ],
            ),
            const SizedBox(height: 25),
            Text('addMedicine.notificationsLabel'.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: const Offset(0, 1))],
              ),
              child: Obx(() => SwitchListTile(
                    title: Text('addMedicine.enableDoseReminders'.tr),
                    subtitle: Text('addMedicine.remindersSubtext'.tr),
                    value: _dataServiceController.notificationsEnabled.value,
                    onChanged: (bool value) => _dataServiceController.notificationsEnabled.value = value,
                    activeColor: Colors.green,
                    secondary: Icon(Icons.notifications_active_outlined, color: _dataServiceController.notificationsEnabled.value ? Colors.green : Colors.grey),
                  )),
            ),
            const SizedBox(height: 20),
          ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: const Offset(0, 1))],
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none, counterText: ''),
      ),
    );
  }

  Widget _buildPickerContainer({required String iconAsset, required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: const Offset(0, 1))],
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconAsset, width: 18, height: 18, colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn)),
          const SizedBox(width: 8),
          Expanded(child: child),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildWhenToTakeOption(BuildContext context, {required String label, required String value, required String iconAsset}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _dataServiceController.withFood.value = value,
        child: Obx(() {
          final isSelected = _dataServiceController.withFood.value == value;
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: isSelected ? Colors.green : Colors.grey.shade300),
              boxShadow: [if (isSelected) BoxShadow(color: Colors.green.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))],
            ),
            child: Column(
              children: [
                SvgPicture.asset(iconAsset, height: 50),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 5),
                    Icon(isSelected ? Icons.check_circle : Icons.radio_button_unchecked, color: isSelected ? Colors.green : Colors.grey, size: 18),
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
        height: 350,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('addMedicine.selectDoseTimes'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tempTimes.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(tempTimes[index].format(context)),
                    trailing: IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red), onPressed: () {
                      setState(() {tempTimes.removeAt(index);});
                       Get.back(); _showDoseTimesPicker(context);
                    }),
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(context: context, initialTime: tempTimes[index]);
                      if (picked != null) {
                        setState(() {tempTimes[index] = picked;});
                        Get.back(); _showDoseTimesPicker(context);
                      }
                    },
                  );
                },
              ),
            ),
            TextButton.icon(icon: const Icon(Icons.add_alarm), label: Text('addMedicine.addTime'.tr), onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if (picked != null) {
                setState(() {tempTimes.add(picked);});
                Get.back(); _showDoseTimesPicker(context);
              }
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(child: Text('general.done'.tr), onPressed: () {
                tempTimes.sort((a, b) => (a.hour * 60 + a.minute).compareTo(b.hour * 60 + b.minute));
                _dataServiceController.notifications.assignAll(tempTimes);
                Get.back();
              }),
            )
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
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16.0), child: Text('addMedicine.selectDuration'.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) => tempDuration = index + 1,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: List<Widget>.generate(90, (index) => Center(child: Text('${index + 1} ${'addMedicine.days'.tr}'))),
                ),
                controller: FixedExtentScrollController(initialItem: tempDuration > 0 ? tempDuration -1 : 0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(child: Text('general.done'.tr), onPressed: () {
                _dataServiceController.duration.value = tempDuration;
                Get.back();
              }),
            )
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
  
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedStartDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageQuantityController.dispose();
    _dosageUnitController.dispose();
    super.dispose();
  }
}

