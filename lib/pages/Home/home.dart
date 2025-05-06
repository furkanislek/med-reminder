import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mr/components/home/medicine_card.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/pages/AddPill/add_pill.dart';
import 'package:mr/services/data_service.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final DataService dataService = Get.find<DataService>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dataService.getMedicinesStream(); // Initialize stream

    return Scaffold(
      appBar: AppBar(
        title: Text('home.title'.tr), // Localized title
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Obx(() {
            // Only show filter if there are types to filter by
            if (controller.getUniqueDrugTypes().isNotEmpty &&
                controller.getUniqueDrugTypes().length > 1) {
              return PopupMenuButton<String>(
                icon: const Icon(Icons.filter_list, color: Colors.grey),
                onSelected: (String type) {
                  controller.updateDrugTypeFilter(
                    type == 'all_types_filter_key'.tr ? '' : type,
                  );
                },
                itemBuilder: (BuildContext context) {
                  List<PopupMenuItem<String>> items = [];
                  items.add(
                    PopupMenuItem<String>(
                      value:
                          'all_types_filter_key'
                              .tr, // Use a distinct value for 'All Types'
                      child: Text(
                        'filter.allTypes'.tr,
                      ), // Localized 'All Types'
                    ),
                  );
                  items.addAll(
                    controller.getUniqueDrugTypes().map((String type) {
                      return PopupMenuItem<String>(
                        value: type,
                        child: Text(
                          type.isNotEmpty ? type : 'filter.uncategorized'.tr,
                        ), // Handle empty type names
                      );
                    }).toList(),
                  );
                  return items;
                },
              );
            } else {
              return Container(); // Return empty container if no types or only one type
            }
          }),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: SvgPicture.asset('assets/svg/vitamin.svg'),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'filter.searchHint'.tr, // Localized hint text
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
              onChanged: (value) {
                controller.updateSearchQuery(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                'home.addMedicine'.tr, // Localized button text
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
              ),
              onPressed: () {
                Get.to(() => AddPillScreen());
              },
            ),
            const SizedBox(height: 20),
            Expanded(child: MedicineListView(controller: controller)),
          ],
        ),
      ),
    );
  }
}
