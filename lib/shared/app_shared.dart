import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const LocaleKey = 'app_locale';
  static Future<void> setAppLocale(String locale) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(LocaleKey, locale);
  }

  static Future<String> getAppLocale() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(LocaleKey) ?? 'en';
  }
}
