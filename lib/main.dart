import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mr/controller/auth/auth_controller.dart';
import 'package:mr/controller/data/data_service_controller.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/pages/Login/login.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/notification_service.dart';
import 'package:mr/utils/localization/app_translations.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:mr/services/locale_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final LocaleService localeService = LocaleService();
  Locale? savedLocale = await localeService.getLocale();
  Locale initialAppLocale;

  if (savedLocale != null) {
    initialAppLocale = savedLocale;
    print(
      'Kaydedilmiş dil bulundu ve kullanılıyor: ${initialAppLocale.toLanguageTag()}',
    );
  } else {
    Locale? deviceLocale = Get.deviceLocale;
    print('Kaydedilmiş dil yok. Cihaz dili: ${deviceLocale?.toLanguageTag()}');

    if (deviceLocale != null && deviceLocale.languageCode == 'tr') {
      initialAppLocale = const Locale('tr', 'TR');
    } else {
      initialAppLocale = const Locale('en', 'US');
    }
    print(
      'Varsayılan uygulama dili ${initialAppLocale.toLanguageTag()} olarak ayarlandı ve kaydediliyor.',
    );
    await localeService.saveLocale(initialAppLocale);
  }

  Get.put(AuthController());
  Get.put(DataService());
  Get.put(NotificationService());
  Get.put(HomeController());
  Get.put(DataServiceController());

  runApp(MyApp(initialLocale: initialAppLocale));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;

  const MyApp({super.key, required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: initialLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: Obx(() {
        final authController = Get.find<AuthController>();
        return authController.user.value == null ? const Login() : Menu();
      }),
    );
  }
}
