import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/shared/app_local_controller.dart';
import 'package:portfolio/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/shared/app_theme_controller.dart';
import 'package:portfolio/styles/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocalControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);

    // Replace with your fo
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('km')],
      darkTheme: AppTheme(fontFamily: _fontfamily(locale.value)).dark,
      theme: AppTheme(fontFamily: _fontfamily(locale.value)).light,
      themeMode: theme.value,
      debugShowCheckedModeBanner: false,
      locale: locale.when(
        data: (locale) => Locale(locale),
        loading: () => const Locale('en'),
        error: (_, __) => const Locale('en'),
      ),
      home: const MyHomePage(),
    );
  }

  String _fontfamily(String? locale) {
    return (locale ?? 'en') == 'en' ? 'Angkor' : 'khmer';
  }
}
