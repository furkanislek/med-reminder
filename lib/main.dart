import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mr/controller/auth/auth_controller.dart';
import 'package:mr/pages/Login/login.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Obx(() {
        final authController = Get.find<AuthController>();

        print("Auth + ${authController.user.value}");
        return authController.user.value == null ? const Login() : Menu();
      }),
    );
  }
}
