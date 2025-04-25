import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/styles/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('km')],
      // locale: Locale('km'),
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      home: const MyHomePage(),
    );
  }
}
