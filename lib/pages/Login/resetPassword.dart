import 'package:mr/pages/Login/login.dart';
import 'package:mr/pages/Login/password_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  String? errorMessage;

  Future<void> resetPassword() async {
    String email = emailController.text;
    if (email.isEmpty) {
      setState(() {
        errorMessage = "auth.emailRequired".tr;
      });
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (mounted) {
        Get.off(() => Confirm());
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          icon: Icon(Icons.arrow_back, size: 24.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/reset.svg', height: 200.h),
              SizedBox(height: 40.h),
              Text(
                "auth.resetPassword".tr,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "auth.resetPasswordInstructions".tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700], fontSize: 12.sp),
              ),
              SizedBox(height: 40.h),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "auth.yourEmail".tr,
                  prefixIcon: Icon(Icons.email, size: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              if (errorMessage != null)
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                ),
              SizedBox(height: 25.h),
              ElevatedButton(
                onPressed: resetPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8256DF),
                  padding: EdgeInsets.symmetric(
                    vertical: 14.h,
                    horizontal: 100.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  "auth.resetButton".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
