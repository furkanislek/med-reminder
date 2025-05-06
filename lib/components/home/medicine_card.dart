import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/models/medicine_model.dart';

class MedicineListView extends StatelessWidget {
  final HomeController controller;

  const MedicineListView({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.filteredMedicines.isEmpty) {
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
    });
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
      color: const Color.fromARGB(255, 250, 250, 255),
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
                ],
              ),
            ),
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/svg/${medicine.type}.svg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[200],
                      child: Icon(Icons.abc, color: Colors.grey[400], size: 40),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
