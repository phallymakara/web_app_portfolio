import 'package:flutter/material.dart';
import 'package:portfolio/shared/app_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_theme_controller.g.dart';

@Riverpod(keepAlive: true)
class AppThemeController extends _$AppThemeController {
  @override
  Future<ThemeMode> build() async {
    final theme = await AppSharedPref.getAppTheme();
    return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> changeTheme(ThemeMode theme) async {
    await AppSharedPref.setAppTheme(theme == ThemeMode.dark ? 'dark' : 'light');
    state = AsyncData(theme);
  }
}
