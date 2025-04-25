import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLocalController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return 'en';
  }

  void changeLocale(String newLocale) {
    state = AsyncData(newLocale); //  correct way to update state
  }
}
