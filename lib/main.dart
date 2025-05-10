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
    } else if (deviceLocale != null && deviceLocale.languageCode == 'de') {
      initialAppLocale = const Locale('de', 'DE');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'fr') {
      initialAppLocale = const Locale('fr', 'FR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'es') {
      initialAppLocale = const Locale('es', 'ES');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'pt') {
      initialAppLocale = const Locale('pt', 'BR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'zh') {
      initialAppLocale = const Locale('zh', 'CN');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'hi') {
      initialAppLocale = const Locale('hi', 'IN');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ar') {
      initialAppLocale = const Locale('ar', 'SA');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ru') {
      initialAppLocale = const Locale('ru', 'RU');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ms') {
      initialAppLocale = const Locale('ms', 'MY');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'id') {
      initialAppLocale = const Locale('id', 'ID');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'bn') {
      initialAppLocale = const Locale('bn', 'BD');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ja') {
      initialAppLocale = const Locale('ja', 'JP');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'ko') {
      initialAppLocale = const Locale('ko', 'KR');
    } else if (deviceLocale != null && deviceLocale.languageCode == 'it') {
      initialAppLocale = const Locale('it', 'IT');
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
