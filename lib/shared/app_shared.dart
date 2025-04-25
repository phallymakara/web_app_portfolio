import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const LocaleKey = 'app_locale';
  static const ThemeKey = 'app_theme';

  static Future<void> setAppLocale(String locale) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(LocaleKey, locale);
  }

  static Future<String> getAppLocale() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(LocaleKey) ?? 'en';
  }

  static Future<void> setAppTheme(String theme) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(ThemeKey, theme);
  }

  static Future<ThemeMode> getAppTheme() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(ThemeKey) == 'light'
        ? ThemeMode.light
        : ThemeMode.dark;
  }
}
