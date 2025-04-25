import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_shared.dart';

class AppLocalController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getAppLocale();
  }

  void changeLocale(String newLocale) async {
    await AppSharedPref.setAppLocale(newLocale);
    state = AsyncData(newLocale); //  correct way to update state
  }
}
