import 'package:portfolio/shared/app_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_local_controller.g.dart';

@Riverpod()
class AppLocalController extends _$AppLocalController {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getAppLocale();
  }

  void changeLocale(String newLocale) async {
    await AppSharedPref.setAppLocale(newLocale);
    state = AsyncData(newLocale);
  }
}
