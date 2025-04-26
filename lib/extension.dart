import 'package:flutter/material.dart';
import 'package:portfolio/app_text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/styles/app_sizes.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  double get width => mq.size.width;
  double get height => mq.size.height;

  ThemeData get theme => Theme.of(this);

  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;
  bool get isDesktopOrTablet =>
      formFactor == FormFactorType.desktop ||
      formFactor == FormFactorType.tablet;

  AppTextStyles get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyles(); // Ensure this class exists in app_text_styles.dart
      case FormFactorType.desktop:
        return LargeTextStyles(); // Ensure this class exists in app_text_styles.dart
    }
  }

  AppInsets get insets {
    switch (formFactor) {
      case FormFactorType.mobile:
        return SmallInsets(); // Ensure this class exists in app_text_styles.dart
      case FormFactorType.desktop:
      case FormFactorType.tablet:
        return LargeInsets(); // Ensure this class exists in app_text_styles.dart
    }
  }

  AppLocalizations get texts =>
      AppLocalizations.of(this) ?? lookupAppLocalizations(const Locale('en'));
  ColorScheme get colorScheme => theme.colorScheme;
}
