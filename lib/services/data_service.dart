import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mr/models/medicine_model.dart';

class DataService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> saveMedicine({
    required String name,
    required String type,
    required int dosageQuantity,
    required String dosageUnit,
    required List<String> doseHours,
    required int duration,
    required String withFood,
    required bool notificationsEnabled, // Added parameter
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      doseHours.sort();

      Map<String, dynamic> medicineData = {
        'name': name,
        'types': type,
        'quantity': dosageQuantity,
        'unit': dosageUnit,
        'doseHours': doseHours,
        'duration': duration,
        'withFood': withFood,
        'notificationsEnabled': notificationsEnabled,
        'createdAt': FieldValue.serverTimestamp(),
        'uid': user.uid,
      };

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('medicines')
          .add(medicineData);
    } catch (e) {
      print("saveMedicine error: $e");
      rethrow;
    }
  }

  Future<void> updateMedicine({
    required String medicineId,
    required String name,
    required String type,
    required int dosageQuantity,
    required String dosageUnit,
    required List<String> doseHours,
    required int duration,
    required String withFood,
    required bool notificationsEnabled,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      doseHours.sort();

      Map<String, dynamic> updatedMedicineData = {
        'name': name,
        'types': type,
        'quantity': dosageQuantity,
        'unit': dosageUnit,
        'doseHours': doseHours,
        'duration': duration,
        'withFood': withFood,
        'notificationsEnabled': notificationsEnabled,
        'updatedAt': FieldValue.serverTimestamp(), // Add an updatedAt timestamp
      };

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('medicines')
          .doc(medicineId)
          .update(updatedMedicineData);
    } catch (e) {
      print("updateMedicine error for $medicineId: $e");
      rethrow;
    }
  }

  Stream<List<MedicineModel>> getMedicinesStream() {
    User? user = _firebaseAuth.currentUser;
    if (user == null) {
      return Stream.value([]);
    }

    return _firestore
        .collection('users')
        .doc(user.uid)
        .collection('medicines')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) {
                try {
                  return MedicineModel.fromMap(doc.id, doc.data());
                } catch (e) {
                  print("Error parsing medicine doc ${doc.id}: $e");
                  return null;
                }
              })
              .where((model) => model != null)
              .cast<MedicineModel>()
              .toList();
        });
  }

  Future<void> updateNotificationStatus(String medicineId, bool enabled) async {
    User? user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("User Not Found!");

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('medicines')
          .doc(medicineId)
          .update({'notificationsEnabled': enabled});
    } catch (e) {
      print("Error updating notification status for $medicineId: $e");
      rethrow;
    }
  }

  Future<void> deleteMedicine(String medicineId) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('medicines')
          .doc(medicineId)
          .delete();
    } catch (e) {
      print("deleteMedicine error for $medicineId: $e");
      rethrow;
    }
  }
}
