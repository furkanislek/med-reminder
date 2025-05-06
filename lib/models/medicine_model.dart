import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MedicineModel {
  final String id;
  final String name;
  final String type;
  final int dosesPerDay;
  final List<String> doseHours;
  final int dosageQuantity;
  final String dosageUnit;
  final int duration;
  final String withFood;
  final Timestamp startDate;
  final bool notificationsEnabled;

  DateTime? nextDoseTime;
  bool isCompleted = false;

  MedicineModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dosesPerDay,
    required this.doseHours,
    required this.dosageQuantity,
    required this.dosageUnit,
    required this.duration,
    required this.withFood,
    required this.startDate,
    required this.notificationsEnabled,
    this.nextDoseTime,
    this.isCompleted = false,
  });

  factory MedicineModel.fromMap(String id, Map<String, dynamic> data) {
    List<String> hours = [];
    if (data['doseHours'] != null && data['doseHours'] is List) {
      hours = List<String>.from(data['doseHours']);
    } else if (data['notifications'] != null && data['notifications'] is List) {
      hours =
          (data['notifications'] as List).map((ts) {
            if (ts is Timestamp) {
              DateTime dt = ts.toDate();
              return DateFormat('HH:mm').format(dt);
            }
            return '00:00';
          }).toList();
      hours.sort();
    }

    int inferredDosesPerDay = hours.length;
    int durationDays = data['duration'] ?? 0;
    Timestamp start = data['createdAt'] ?? data['date'] ?? Timestamp.now();

    return MedicineModel(
      id: id,
      name: data['name'] ?? 'Unknown Name',
      type: data['types'] ?? 'Unknown Type',
      dosesPerDay: inferredDosesPerDay,
      doseHours: hours,
      dosageQuantity: data['quantity'] ?? (data['amount'] ?? 0),
      dosageUnit: data['unit'] ?? '',
      duration: durationDays,
      withFood: data['withFood'] ?? data['whenTime'] ?? '',
      startDate: start,
      notificationsEnabled: data['notificationsEnabled'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'types': type,
      'doseHours': doseHours,
      'quantity': dosageQuantity,
      'unit': dosageUnit,
      'duration': duration,
      'withFood': withFood,
      'notificationsEnabled': notificationsEnabled,
    };
  }
}
