import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class DataService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var uuid = Uuid();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> saveMedicines({
    required String name,
    required String doseTimes,
    required String types,
    required int duration,
    required String withFood,
    required List<Timestamp> notifications,
    required String whenTime,
  }) async {
    try {
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      // Şu anki kullanıcıyı al
      User? user = _firebaseAuth.currentUser;
      if (user == null) throw Exception("User Not Found!");

      // Veriyi Firestore'a kaydet
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('medicines')
          .add({
            'name': name,
            'doseTime': doseTimes,
            'types': types,
            'duration': duration,
            'withFood': withFood,
            'notifications': notifications,
            'whenTime': whenTime,
            'createdAt': FieldValue.serverTimestamp(),
            'date': DateTime.now(),
            'timestamp': currentTimestamp,
            'uid': user.uid,
          });
    } catch (e) {
      print("addMedicine error: $e");
      rethrow;
    }
  }
}
