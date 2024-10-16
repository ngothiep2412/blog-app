import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/router/router_imports.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Future<void> manipulateLogin(context) async {
    var token = await getToken();

    if (token != null) {
      AutoRouter.of(context).replace(const GeneralRoute());
    } else {
      AutoRouter.of(context).replace(const OnboardRoute());
    }
  }

  static Future<void> saveToken(String token) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }

  static Future<void> clearAllSavedData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.clear();
  }

  static Future<void> saveLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("locale", locale.toString());
  }

  static Future<Locale> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var localeString = prefs.getString("locale");
    switch (localeString) {
      case 'en_US':
        return const Locale('en', 'US');
      default:
        return const Locale('vi', 'VN');
    }
  }
}
