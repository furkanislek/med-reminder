import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mr/controller/auth/auth_controller.dart';
import 'package:mr/pages/Login/login.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'package:mr/utils/localization/app_translations.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: Obx(() {
        final authController = Get.find<AuthController>();
        return authController.user.value == null ? const Login() : Menu();
      }),
    );
  }
}
