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
  String? profileImageSource; // Base64 ya da URL olabilir
  bool isBase64Image = true;
  bool isLoading = true;
  String firstName = '';
  String surname = '';
  String? profileImageBase64;
  String selectedLanguage = 'tr_TR';

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    selectedLanguage = Get.locale?.toString() ?? 'tr_TR';
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await Auth().fetchUser();
      final firebaseUser = Auth().currentUser;

      setState(() {
        firstName = userData?['firstName'] ?? '';
        surname = userData?['surname'] ?? '';

        final base64Image = userData?['profileImage'];
        if (base64Image != null && base64Image.toString().isNotEmpty) {
          profileImageSource = base64Image;
          isBase64Image = true;
        } else if (firebaseUser?.photoURL != null) {
          profileImageSource = firebaseUser!.photoURL!;
          isBase64Image = false;
        }

        isLoading = false;
      });
    } catch (e) {
      print('Kullanıcı bilgileri yüklenirken hata: $e');
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
    }
  }

  ImageProvider _getProfileImage() {
    if (profileImageSource != null && profileImageSource!.isNotEmpty) {
      if (isBase64Image) {
        return MemoryImage(base64Decode(profileImageSource!));
      } else {
        return NetworkImage(profileImageSource!);
      }
    } else {
      return const AssetImage('assets/avatar.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("----------------------------------");
    print(Auth().currentUser);
    print("----------------------------------");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'settings.profile'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
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
                            Auth().currentUser?.email ?? 'profile.noEmail'.tr,
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
                                  ].map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value == 'tr_TR' ? 'Türkçe' : 'English',
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
                              Get.offAll(() => Login());
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
}
