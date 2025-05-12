import 'package:mr/Introduction/introduction_screens.dart';
import 'package:mr/pages/Login/register.dart';
import 'package:mr/pages/Login/resetPassword.dart';
import 'package:mr/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width / 12,
          vertical: height / 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height / 20),
              SvgPicture.asset('assets/svg/login.svg', height: height / 3.75),
              SizedBox(height: height / 120),
              Text(
                "login.login_into_your_account".tr,
                style: TextStyle(
                  fontSize: height / 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: height / 80),
              RichText(
                text: TextSpan(
                  text: "login.dont_have_an_account".tr,
                  style: TextStyle(color: Colors.grey[700]),
                  children: [
                    TextSpan(
                      text: "login.sign_up".tr,
                      style: TextStyle(
                        color: const Color(0xFF8256DF),
                        fontWeight: FontWeight.bold,
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
              SizedBox(height: height / 20),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "login.your_email".tr,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "login.type_your_password".tr,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: const Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              if (errorMessage != null)
                Padding(
                  padding: EdgeInsets.only(top: height / 50),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: height / 30),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8256DF),
                    padding: EdgeInsets.symmetric(
                      vertical: height / 56.33,
                      horizontal: width / 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "login.login".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 40),
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
                    fontSize: height / 55,
                  ),
                ),
              ),

              SizedBox(height: height / 90),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "login.or".tr,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: height / 60,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(thickness: 1, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 40),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: signInWithGoogle,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: height / 56.33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    'assets/svg/google.svg',
                    height: height / 40,
                  ),
                  label: Text(
                    "login.login_with_google".tr,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: height / 55,
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
