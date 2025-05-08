import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  static const String _languageCodeKey = 'languageCode';
  static const String _countryCodeKey = 'countryCode';

  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);
    if (locale.countryCode != null && locale.countryCode!.isNotEmpty) {
      await prefs.setString(_countryCodeKey, locale.countryCode!);
    } else {
      await prefs.remove(_countryCodeKey); 
    }
    print('Locale saved: ${locale.toLanguageTag()}');
  }

  Future<Locale?> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageCodeKey);

    if (languageCode != null) {
      final countryCode = prefs.getString(_countryCodeKey);
      Locale loadedLocale = Locale(languageCode, countryCode);
      print('Locale loaded: ${loadedLocale.toLanguageTag()}');
      return loadedLocale;
    }
    print('No locale saved, returning null.');
    return null; 
  }
}
