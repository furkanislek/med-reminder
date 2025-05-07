import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import for formatting time
import 'package:mr/controller/data/data_service_controller.dart';
import 'package:mr/pages/Menu/menu.dart';

class AddPillScreen extends StatelessWidget {
  AddPillScreen({super.key});
  final DataServiceController controller =
      Get.find<DataServiceController>(); // Use Get.find if already put

  // Categories remain the same
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
  Widget build(BuildContext context) {
    // Reset controller fields when screen is built (optional, depends on desired behavior)
    // WidgetsBinding.instance.addPostFrameCallback((_) => controller._resetForm());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.resetForm(); // Reset form on back press
            Get.back();
          },
        ),
        title: const Text('Add Medicine'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: ElevatedButton(
          onPressed: () async {
            await controller.saveMedicineData();
            // Navigate only if save is successful (no snackbar shown)
            if (!Get.isSnackbarOpen) {
              // Get.back(); // Go back after saving
              // Or navigate to home
              Get.offAll(() => Menu()); // Go to Menu, remove AddPill from stack
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0996C7),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            minimumSize: Size(double.infinity, 50),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
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
            // --- Name Input ---
            const Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              hint: "Medicine Name (e.g., Paracetamol)",
              onChanged: (value) => controller.name.value = value,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 25),

            // --- Dosage Quantity and Unit ---
            const Text(
              'Dosage',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildTextField(
                    hint: "Quantity (e.g., 500)",
                    onChanged:
                        (value) =>
                            controller.dosageQuantity.value =
                                int.tryParse(value) ?? 0,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: _buildTextField(
                    hint: "Unit (e.g., mg)",
                    onChanged: (value) => controller.dosageUnit.value = value,
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // --- Category Selection ---
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      right: 15.0,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Obx(() {
                      final selected =
                          controller.types.value == _categories[index][1];
                      return GestureDetector(
                        onTap:
                            () =>
                                controller.types.value = _categories[index][1],
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                selected
                                    ? const Color.fromARGB(255, 219, 219, 219)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
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
                            width: 45,
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                _categories[index][0],
                                width: 40,
                                height: 40,
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
            const SizedBox(height: 25),

            // --- Dose Times & Duration Selection ---
            const Text(
              'Frequency & Duration',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
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
                              ? 'Select Dose Times'
                              : '${controller.notifications.length} time(s) selected',
                          style: TextStyle(
                            color:
                                controller.notifications.isEmpty
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _showDurationPicker(context),
                    child: _buildPickerContainer(
                      iconAsset: 'assets/svg/calendar.svg',
                      child: Obx(
                        () => Text(
                          controller.duration.value == 0
                              ? 'Select Duration'
                              : '${controller.duration.value} day(s)',
                          style: TextStyle(
                            color:
                                controller.duration.value == 0
                                    ? Colors.grey
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // --- When to Take Selection (Using withFood) ---
            const Text(
              'When to Take',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildWhenToTakeOption(
                  context,
                  label: 'Before Food',
                  value: 'Before Food',
                  iconAsset: 'assets/svg/beforedinner.svg',
                ),
                const SizedBox(width: 12),
                _buildWhenToTakeOption(
                  context,
                  label: 'After Food',
                  value: 'After Food',
                  iconAsset: 'assets/svg/afterdinner.svg',
                ),
              ],
            ),

            const SizedBox(height: 25),

            // --- Notification Toggle ---
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
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
                  title: const Text('Enable Dose Reminders'),
                  subtitle: const Text(
                    'Receive a notification 5 minutes before each dose',
                  ),
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
            const SizedBox(height: 20), // Add some padding at the bottom
          ],
        ),
      ),
    );
  }

  // Helper widget for TextFields
  Widget _buildTextField({
    required String hint,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    int maxLength = 50,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
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

  // Helper widget for picker containers
  Widget _buildPickerContainer({
    required String iconAsset,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
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
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
          Expanded(child: child),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  // Helper widget for 'When to Take' options
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
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
                SvgPicture.asset(iconAsset, height: 50),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label, textAlign: TextAlign.center),
                    SizedBox(width: 5),
                    Icon(
                      isSelected
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: isSelected ? Colors.green : Colors.grey,
                      size: 18,
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

  // --- Bottom Sheet for Dose Times ---
  void _showDoseTimesPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: 350,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Select Dose Times", style: Get.textTheme.titleLarge),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.notifications.length + 1,
                  itemBuilder: (ctx, index) {
                    if (index == controller.notifications.length) {
                      return ListTile(
                        leading: Icon(Icons.add_alarm),
                        title: Text("Add Time"),
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
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text("Done"),
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  // --- Bottom Sheet for Duration ---
  void _showDurationPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "addMedicine.durationPickerTitle".tr,
                style: Get.textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 90, // Increased duration limit
                itemBuilder: (ctx, index) {
                  final days = index + 1;
                  return Obx(
                    () => RadioListTile<int>(
                      title: Text("$days day${days > 1 ? 's' : ''}"),
                      value: days,
                      groupValue: controller.duration.value,
                      onChanged: (value) {
                        if (value != null) controller.duration.value = value;
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text("Done"),
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
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
