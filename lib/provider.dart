import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app_local_controller.dart';

final appLocaleProvider = AsyncNotifierProvider<AppLocalController, String>(
  AppLocalController.new,
);
