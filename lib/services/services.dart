import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'dart:io';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var uuid = Uuid();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String surname,
    File? profileImage,
  }) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    print("profileImage: $profileImage");

    String? photoBase64;
    if (profileImage != null) {
      photoBase64 = base64Encode(await profileImage.readAsBytes());
    }

    print("photoBase64: $photoBase64");

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user?.uid)
        .set({
          "firstName": firstName,
          "surname": surname,
          "photoBase64": photoBase64,
        });

    await userCredential.user?.sendEmailVerification();

    await signOut();
  }

  Future<void> signIn({required String email, required String password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user?.emailVerified == false) {
      await _firebaseAuth.signOut();
      throw FirebaseAuthException(
        code: 'email-not-verified',
        message: 'Please verify your email address before logging in.',
      );
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Map<String, dynamic>?> fetchUser() async {
    final currentUserID = Auth().currentUser!.uid;

    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection("users")
              .doc(currentUserID)
              .get();

      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        print("User document does not exist");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  Future<void> updateUserNotificationPreference(bool enabled) async {
    final currentUserID = Auth().currentUser!.uid;

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID)
          .update({"notificationsEnabled": enabled});
      print("Bildirim tercihi güncellendi: $enabled");
    } catch (e) {
      print("Bildirim tercihi güncellenirken hata: $e");
    }
  }


  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print('Google oturumu iptal edildi.');
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      final user = userCredential.user;

      if (user != null) {
        DocumentSnapshot userDoc =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

        if (!userDoc.exists) {
          // Yeni kullanıcıysa Firestore'a kaydet
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set({
                "firstName": user.displayName?.split(" ").first ?? "",
                "surname": user.displayName?.split(" ").skip(1).join(" ") ?? "",
                "photo": user.photoURL,
                "email": user.email,
                "notificationsEnabled": true,
              });
        }
      }
    } catch (e) {
      print('Google ile girişte hata: $e');
      rethrow;
    }
  }
}
