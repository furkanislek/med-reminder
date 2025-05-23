import 'package:mr/Introduction/introduction_screens.dart';
import 'package:mr/pages/Login/register.dart';
import 'package:mr/pages/Login/resetPassword.dart';
import 'package:mr/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;
  String? errorMessage;

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: emailController.text,
        password: passwordController.text,
      );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.off(() => const IntroductionScreens());
      }
    } on FirebaseAuthException catch (e) {
      String? errorText;
      switch (e.code) {
        case 'invalid-email':
          errorText = "login.invalid_email".tr;
          break;
        case 'user-disabled':
          errorText = "login.user_disabled".tr;
          break;
        case 'user-not-found':
        case 'invalid-credential':
        case 'wrong-password':
          errorText = "login.wrong_password".tr;
          break;
        case 'email-already-in-use':
          errorText = "login.email_already_in_use".tr;
          break;
        case 'operation-not-allowed':
          errorText = "login.operation_not_allowed".tr;
          break;
        case 'email-not-verified':
          errorText = 'login.email_not_verified'.tr;
        default:
          errorText = "login.error_occured".tr;
      }
      setState(() {
        errorMessage = errorText;
      });
    }
  }

  Future<void> resetPassword() async {
    String email = emailController.text;
    if (email.isEmpty) {
      setState(() {
        errorMessage = "login.please_enter_your_email".tr;
      });
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("login.password_reset_email_sent".tr)),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await Auth().signInWithGoogle();

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IntroductionScreens()),
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = "login.error_occured_google".tr;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              SvgPicture.asset('assets/svg/login.svg', height: 200.h),
              SizedBox(height: 8.h),
              Text(
                "login.login_into_your_account".tr,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(
                  text: "login.dont_have_an_account".tr,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14.sp),
                  children: [
                    TextSpan(
                      text: "login.sign_up".tr,
                      style: TextStyle(
                        color: const Color(0xFF8256DF),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "login.your_email".tr,
                  prefixIcon: Icon(Icons.email, size: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "login.type_your_password".tr,
                  prefixIcon: Icon(Icons.lock, size: 20.sp),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(Icons.visibility, size: 20.sp),
                  ),
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
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: signIn,
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
                    "login.login".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPassword(),
                    ),
                  );
                },
                child: Text(
                  "login.forgot_password".tr,
                  style: TextStyle(
                    color: const Color(0xFF8256DF),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),

              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "login.or".tr,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: signInWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  icon: SvgPicture.asset('assets/svg/google.svg', height: 20.h),
                  label: Text(
                    "login.login_with_google".tr,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
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
