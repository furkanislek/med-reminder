import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/models/medicine_model.dart';
import 'package:mr/pages/AddPill/add_pill.dart';
import 'package:mr/services/data_service.dart'; 

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final DataService dataService = Get.find<DataService>();

  @override
  Widget build(BuildContext context) {
    dataService.getMedicinesStream();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.grey),
            onPressed: () {
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'assets/svg/vitamin.svg',
              ), 
              radius: 16,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Medicines...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
              onChanged: (value) {
                controller.updateSearchQuery(value);
              },
            ),
            SizedBox(height: 20),
            // Add Medicine Button
            ElevatedButton.icon(
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Add Medicine',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
              ),
              onPressed: () {
                Get.to(() => AddPillScreen());
              },
            ),
            SizedBox(height: 20),
            // Medicine List - Use filteredMedicines
            Expanded(
              child: Obx(() {
                // Listen to changes in controller.filteredMedicines
                if (controller.filteredMedicines.isEmpty) {
                  // Show different message based on whether a search is active
                  bool isSearching = controller.searchQuery.value.isNotEmpty;
                  return Center(
                    child: Text(
                      isSearching
                          ? 'No medicines found matching "${controller.searchQuery.value}"'
                          : 'No medicines added yet. Tap \'Add Medicine\' to start.',
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineCard extends StatelessWidget {
  final MedicineModel medicine;

  const MedicineCard({Key? key, required this.medicine}) : super(key: key);

  String _formatNextDose(DateTime? nextDoseTime, bool isCompleted) {
    if (isCompleted) {
      return "Treatment Completed";
    }
    if (nextDoseTime == null) {
      return "Next dose: N/A";
    }
    return "Next dose: ${DateFormat('h:mm a').format(nextDoseTime)}";
  }

  String _getFrequencyText(int dosesPerDay) {
    switch (dosesPerDay) {
      case 1:
        return "Once daily";
      case 2:
        return "Twice daily";
      case 3:
        return "Thrice daily";
      default:
        return "$dosesPerDay times daily";
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
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    dosageInfo,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    nextDoseText,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          medicine.isCompleted ? Colors.green : Colors.black87,
                      fontWeight:
                          medicine.isCompleted
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 12),
                  OutlinedButton(
                    child: Text('Details'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: BorderSide(color: Colors.redAccent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Placeholder for medicine image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'assets/svg/vitamin.svg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.medication_outlined,
                        color: Colors.grey[400],
                        size: 40,
                      ),
                    ), // Placeholder on error
              ),
            ),
          ],
        ),
      ),
    );
  }
}
