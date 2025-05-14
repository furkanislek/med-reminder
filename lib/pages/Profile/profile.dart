import 'package:flutter/material.dart';
import 'package:mr/pages/Login/login.dart';
import 'package:mr/services/locale_service.dart';
import 'dart:convert';
import '../../services/services.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<Map<String, String>> languages = [
    {'code': 'tr_TR', 'name': 'Türkçe'},
    {'code': 'en_US', 'name': 'English'},
    {'code': 'de_DE', 'name': 'Deutsch'},
    {'code': 'fr_FR', 'name': 'Français'},
    {'code': 'es_ES', 'name': 'Español'},
    {'code': 'pt_BR', 'name': 'Português'},
    {'code': 'zh_CN', 'name': '中文'},
    {'code': 'hi_IN', 'name': 'हिन्दी'},
    {'code': 'ar_SA', 'name': 'العربية'},
    {'code': 'ru_RU', 'name': 'Русский'},
    {'code': 'ms_MY', 'name': 'Bahasa Malaysia'},
    {'code': 'id_ID', 'name': 'Bahasa Indonesia'},
    {'code': 'bn_BD', 'name': 'বাংলা'},
    {'code': 'ja_JP', 'name': '日本語'},
    {'code': 'ko_KR', 'name': '한국어'},
    {'code': 'it_IT', 'name': 'Italiano'},
  ];

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

  void _showLanguagePicker(BuildContext context) {
    String tempLanguage = selectedLanguage;
    int initialIndex = languages.indexWhere(
      (lang) => lang['code'] == selectedLanguage,
    );
    if (initialIndex < 0) initialIndex = 0;

    Get.bottomSheet(
      Container(
        height: 300.h,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'settings.selectLanguage'.tr,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: 50.h,
                perspective: 0.005,
                diameterRatio: 1.2,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged:
                    (index) => tempLanguage = languages[index]['code']!,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children:
                      languages
                          .map(
                            (lang) => Center(
                              child: Text(
                                lang['name']!,
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ),
                          )
                          .toList(),
                ),
                controller: FixedExtentScrollController(
                  initialItem: initialIndex,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: SizedBox(
                  width: 200.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      'general.done'.tr,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.blue,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () {
                  _changeLanguage(tempLanguage);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 50.h,
                  bottom: 16.h,
                ),
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
                        : CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),

                    Text(
                      "${firstName.toUpperCase()} ${surname.toUpperCase()}",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sansita',
                      ),
                    ),
                    SizedBox(height: 32.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12.r),
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
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          _buildInfoRow(
                            Icons.email,
                            Auth().currentUser?.email != null &&
                                    Auth().currentUser!.email!.isNotEmpty
                                ? Auth().currentUser!.email!
                                : Auth().currentUser?.providerData[0].email ??
                                    'profile.noEmail'.tr,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Tercihler
                    Container(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 8.h,
                        bottom: 0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12.r),
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
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          _buildSettingItem(
                            'settings.language'.tr,
                            Icon(
                              Icons.language,
                              color: Colors.green,
                              size: 20.sp,
                            ),
                            trailing: GestureDetector(
                              onTap: () => _showLanguagePicker(context),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    languages.firstWhere(
                                      (lang) =>
                                          lang['code'] == selectedLanguage,
                                      orElse: () => languages.first,
                                    )['name']!,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Uygulama Hakkında
                    Container(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 8.h,
                        bottom: 0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12.r),
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
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          _buildSettingItem(
                            'app_version'.tr,
                            Icon(
                              Icons.info_outline,
                              color: Colors.purple,
                              size: 20.sp,
                            ),
                            trailing: Text(
                              'version.number'.tr,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _showPrivacyPolicyDialog();
                            },
                            child: _buildSettingItem(
                              'privacy_policy'.tr,
                              Icon(
                                Icons.privacy_tip,
                                color: Colors.orange,
                                size: 20.sp,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Çıkış Düğmesi
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 253, 253),
                        borderRadius: BorderRadius.circular(12.r),
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
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
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
                              Icon(
                                Icons.logout,
                                color: Colors.red,
                                size: 20.sp,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          InkWell(
                            onTap: () {
                              _showDeleteAccountConfirmation();
                            },
                            child: _buildSettingItem(
                              'profile.deleteAccountButton'.tr,
                              Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 20.sp,
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Geliştirici Bilgisi
                    Text(
                      'developer'.tr,
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 20.sp),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(value, style: TextStyle(fontSize: 16.sp))],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, Widget leading, {Widget? trailing}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          leading,
          SizedBox(width: 16.w),
          Text(title, style: TextStyle(fontSize: 16.sp)),
          const Spacer(),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  void _showPrivacyPolicyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.only(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              bottom: 16.h,
            ),
            margin: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.privacy_tip, color: Colors.orange, size: 28.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'privacy_policy'.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Flexible(
                  child: SingleChildScrollView(
                    child: Html(
                      data: 'privacy_policy_content'.tr,
                      style: {
                        "body": Style(
                          fontSize: FontSize(12.sp),
                          lineHeight: LineHeight(1.5),
                        ),
                        "h3": Style(
                          fontSize: FontSize(16.sp),
                          fontWeight: FontWeight.bold,
                        ),
                        "b": Style(fontWeight: FontWeight.bold),
                        "p": Style(
                          fontSize: FontSize(12.sp),
                          lineHeight: LineHeight(1.5),
                        ),
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'general.done'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
              child: Text(
                'profile.cancel'.tr,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            TextButton(
              onPressed: () {
                _deleteAccount();
                Navigator.of(context).pop();
              },
              child: Text(
                'profile.delete'.tr,
                style: TextStyle(color: Colors.red, fontSize: 14.sp),
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
