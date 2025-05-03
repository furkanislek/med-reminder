import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mr/controller/data/data_service_controller.dart';
import 'package:mr/pages/Menu/menu.dart';

class AddPillScreen extends StatelessWidget {
  AddPillScreen({super.key});
  final DataServiceController controller = Get.put(DataServiceController());

  final List<List<String>> _categories = [
    ['assets/svg/eardrops.svg', 'eardrops'],
    ['assets/svg/heartmedicine.svg', 'heartmedicine'],
    ['assets/svg/migraine.svg', 'migraine'],
    ['assets/svg/needle.svg', 'needle'],
    ['assets/svg/stomach.svg', 'stomach'],
    ['assets/svg/syrup.svg', 'syrup'],
    ['assets/svg/vitamin.svg', 'vitamin'],
  ];

  final RxList<TimeOfDay> notifications =
      <TimeOfDay>[
        const TimeOfDay(hour: 7, minute: 0),
        const TimeOfDay(hour: 8, minute: 0),
        const TimeOfDay(hour: 9, minute: 0),
        const TimeOfDay(hour: 10, minute: 0),
        const TimeOfDay(hour: 11, minute: 0),
      ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Add Medicine'),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            controller.saveExpense();
            Get.snackbar(
              'Recorded',
              'Cost successfully recorded!',
              icon: const Icon(Icons.check_circle, color: Colors.green),
              backgroundColor: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0996C7),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
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
            const Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => controller.name(value),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                maxLength: 50,
                decoration: const InputDecoration(
                  hintText: "Name",
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
            const SizedBox(height: 25),
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
                        onTap: () => controller.types(_categories[index][1]),
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
            const Text(
              'Dose Times & Duration',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,

                    child: GestureDetector(
                      onTap: () => _showDoseSelectionBottomSheetPills(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/needle.svg',
                              width: 18,
                              height: 18,
                              colorFilter: const ColorFilter.mode(
                                Colors.blue,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              controller.doseTimes.value.isEmpty
                                  ? 'Dose Times'
                                  : controller.doseTimes.value,
                              style: TextStyle(
                                color:
                                    controller.doseTimes.value.isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    color: Colors.white,

                    child: GestureDetector(
                      onTap: () => _showDoseSelectionBottomSheetDays(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/needle.svg',
                              width: 18,
                              height: 18,
                              colorFilter: const ColorFilter.mode(
                                Colors.blue,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              controller.duration.value.toString().isEmpty
                                  ? 'Duration'
                                  : controller.duration.value.toString(),
                              style: TextStyle(
                                color:
                                    controller.duration.value.toString().isEmpty
                                        ? Colors.grey
                                        : Colors.black,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'When to Take',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.whenTime('Before Dinner'),
                    child: Obx(() {
                      final isSelected =
                          controller.whenTime.value == 'Before Dinner';
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isSelected
                                    ? Colors.green
                                    : Colors.grey.shade300,
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
                            SvgPicture.asset(
                              'assets/svg/beforedinner.svg',
                              height: 70,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Before Dinner'),
                                Icon(
                                  isSelected
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color:
                                      isSelected ? Colors.green : Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.whenTime('After Dinner'),
                    child: Obx(() {
                      final isSelected =
                          controller.whenTime.value == 'After Dinner';
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:
                                isSelected
                                    ? Colors.green
                                    : Colors.grey.shade300,
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
                            SvgPicture.asset(
                              'assets/svg/afterdinner.svg',
                              height: 70,
                            ),
                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('After Dinner'),
                                Icon(
                                  isSelected
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color:
                                      isSelected ? Colors.green : Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Notification Times',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            Obx(() {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  // Mevcut saatleri göster
                  ...controller.notifications.map((time) {
                    return Chip(
                      label: Text(time.format(context)),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () => controller.notifications.remove(time),
                    );
                  }).toList(),

                  // + Butonu
                  GestureDetector(
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        // Aynı saat eklenmesin
                        final alreadyExists = controller.notifications.any(
                          (t) =>
                              t.hour == picked.hour &&
                              t.minute == picked.minute,
                        );
                        if (!alreadyExists) {
                          controller.notifications.add(picked);
                        }
                      }
                    },
                    child: Chip(
                      label: const Text('+ Add'),
                      backgroundColor: Colors.blue.shade100,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showDoseSelectionBottomSheetDays(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Duration ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 90,
                itemBuilder: (context, index) {
                  final dose = index + 1;
                  return ListTile(
                    title: Text('$dose Days${dose > 90 ? 's' : ''}'),
                    onTap: () {
                      controller.duration(dose);
                      controller.durationLabel(
                        '${dose.toString()} Day${dose > 1 ? 's' : ''}',
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDoseSelectionBottomSheetPills(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Dose Times',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  final dose = index + 1;
                  return ListTile(
                    title: Text('$dose pill${dose > 1 ? 's' : ''}'),
                    onTap: () {
                      controller.doseTimes(dose.toString());
                      controller.doseTimes('$dose pill${dose > 1 ? 's' : ''}');
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
