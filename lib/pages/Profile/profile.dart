import 'package:flutter/material.dart';
import 'package:mr/pages/Login/login.dart';
import 'package:mr/services/locale_service.dart';
import 'dart:convert';
import '../../services/services.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LocaleService localeService = LocaleService();

  bool isLoading = true;
  String firstName = '';
  String surname = '';
  String? profileImageBase64;
  String selectedLanguage = 'tr_TR';
  String? photoUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    selectedLanguage = Get.locale?.toString() ?? 'tr_TR';
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await Auth().fetchUser();
      final user = await Auth().currentUser;
      print("user: ${user?.providerData[0].email}");
      if (userData != null) {
        setState(() {
          firstName = userData['firstName'] ?? '';
          surname = userData['surname'] ?? '';
          profileImageBase64 = userData['photoBase64'];
          photoUrl = userData['photo'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Kullanıcı bilgileri yüklenirken hata alındı: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _changeLanguage(String languageCode) async {
    if (languageCode == 'tr_TR') {
      final locale = const Locale('tr', 'TR');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'en_US') {
      final locale = const Locale('en', 'US');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'de_DE') {
      final locale = const Locale('de', 'DE');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'fr_FR') {
      final locale = const Locale('fr', 'FR');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'es_ES') {
      final locale = const Locale('es', 'ES');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'pt_BR') {
      final locale = const Locale('pt', 'BR');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'zh_CN') {
      final locale = const Locale('zh', 'CN');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'hi_IN') {
      final locale = const Locale('hi', 'IN');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'ar_SA') {
      final locale = const Locale('ar', 'SA');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'ru_RU') {
      final locale = const Locale('ru', 'RU');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'ms_MY') {
      final locale = const Locale('ms', 'MY');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'id_ID') {
      final locale = const Locale('id', 'ID');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'bn_BD') {
      final locale = const Locale('bn', 'BD');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'ja_JP') {
      final locale = const Locale('ja', 'JP');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'ko_KR') {
      final locale = const Locale('ko', 'KR');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    } else if (languageCode == 'it_IT') {
      final locale = const Locale('it', 'IT');
      Get.updateLocale(locale);
      await localeService.saveLocale(locale);
    }

    setState(() {
      selectedLanguage = languageCode;
    });
  }

  ImageProvider _getProfileImage() {
    if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
      return MemoryImage(base64Decode(profileImageBase64!));
    } else if (profileImageBase64 == null && photoUrl != null) {
      return NetworkImage(photoUrl!);
    } else {
      return const AssetImage('assets/avatar.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileImageBase64 != null && profileImageBase64!.isNotEmpty
                        ? CircleAvatar(
                          radius: 60,
                          backgroundImage: _getProfileImage(),
                        )
                        : photoUrl != null
                        ? CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(photoUrl!),
                        )
                        : const CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),

                    const SizedBox(height: 16),

                    Text(
                      "${firstName.toUpperCase()} ${surname.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sansita',
                      ),
                    ),
                    const SizedBox(height: 32),

                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 12,
                        bottom: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'personal_info'.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildInfoRow(
                            Icons.email,
                            Auth().currentUser?.email ??
                                Auth().currentUser?.providerData[0].email ??
                                'profile.noEmail'.tr,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Tercihler
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'preferences'.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          _buildSettingItem(
                            'settings.language'.tr,
                            const Icon(Icons.language, color: Colors.green),
                            trailing: DropdownButton<String>(
                              value: selectedLanguage,
                              underline: Container(),
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  _changeLanguage(newValue);
                                }
                              },
                              items:
                                  <String>[
                                    'tr_TR',
                                    'en_US',
                                    'de_DE',
                                    'fr_FR',
                                    'es_ES',
                                    'pt_BR',
                                    'zh_CN',
                                    'hi_IN',
                                    'ar_SA',
                                    'ru_RU',
                                    'ms_MY',
                                    'id_ID',
                                    'bn_BD',
                                    'ja_JP',
                                    'ko_KR',
                                    'it_IT',
                                  ].map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value == 'tr_TR'
                                            ? 'Türkçe'
                                            : value == 'en_US'
                                            ? 'English'
                                            : value == 'de_DE'
                                            ? 'Deutsch'
                                            : value == 'fr_FR'
                                            ? 'Français'
                                            : value == 'es_ES'
                                            ? 'Español'
                                            : value == 'pt_BR'
                                            ? 'Português'
                                            : value == 'zh_CN'
                                            ? '中文'
                                            : value == 'hi_IN'
                                            ? 'हिन्दी'
                                            : value == 'ar_SA'
                                            ? 'العربية'
                                            : value == 'ru_RU'
                                            ? 'Русский'
                                            : value == 'ms_MY'
                                            ? 'Bahasa Malaysia'
                                            : value == 'id_ID'
                                            ? 'Bahasa Indonesia'
                                            : value == 'bn_BD'
                                            ? 'বাংলা'
                                            : value == 'ja_JP'
                                            ? '日本語'
                                            : value == 'ko_KR'
                                            ? '한국어'
                                            : 'Italiano',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Uygulama Hakkında
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 8,
                        bottom: 0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'about_app'.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSettingItem(
                            'app_version'.tr,
                            const Icon(
                              Icons.info_outline,
                              color: Colors.purple,
                            ),
                            trailing: Text(
                              'version.number'.tr,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          _buildSettingItem(
                            'privacy_policy'.tr,
                            const Icon(Icons.privacy_tip, color: Colors.orange),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Çıkış Düğmesi
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'account'.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () async {
                              await Auth().signOut();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: _buildSettingItem(
                              'logout'.tr,
                              const Icon(Icons.logout, color: Colors.red),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {
                              _showDeleteAccountConfirmation();
                            },
                            child: _buildSettingItem(
                              'profile.deleteAccountButton'.tr,
                              const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Geliştirici Bilgisi
                    Text(
                      'developer'.tr,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(value, style: const TextStyle(fontSize: 16))],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, Widget leading, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  void _showDeleteAccountConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('profile.deleteAccountImportant'.tr),
          content: Text('profile.deleteAccountImportantText'.tr),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('profile.cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                _deleteAccount();
                Navigator.of(context).pop();
              },
              child: Text(
                'profile.delete'.tr,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    try {
      await Auth().deleteUser();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('profile.errorDeletingAccount'.tr),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
