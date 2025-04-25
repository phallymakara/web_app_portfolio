import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constant/app_icon.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/widgets/seo_text.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final String test = Localizations.localeOf(context).languageCode;
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: PopUpLanguageSwitchItems(
              language: 'English',
              icon: AppIcon.us,
            ),
          ),
          PopupMenuItem(
            child: PopUpLanguageSwitchItems(
              language: 'Khmer',
              icon: AppIcon.km,
            ),
          ),
        ];
      },
      child: Row(
        children: [
          Icon(Icons.language, color: context.colorScheme.onBackground),
          const Gap(4),
          SEOText(
            Localizations.localeOf(context).languageCode == 'en'
                ? 'En'
                : 'ខ្មែរ',
          ),
        ],
      ),
    );
  }
}

class PopUpLanguageSwitchItems extends StatelessWidget {
  const PopUpLanguageSwitchItems({
    super.key,
    required this.language,
    required this.icon,
  });

  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        const Gap(8),
        SEOText(language),
      ],
    );
  }
}
