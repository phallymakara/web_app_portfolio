import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constant/app_icon.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/widgets/appBar/my_app_bar.dart';
import 'package:portfolio/widgets/seo_text.dart';
// import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.Padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFotter() : _PhoneFotter(),
          const Divider(height: 20),
          // Text('flutter'),
          SEOText(
            context.texts.footer,
            textAlign:
                context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
            style: context.textStyle.titleLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneFotter extends StatelessWidget {
  const _PhoneFotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [AppLogo(), SmallAppMenu(), footerLined()]);
  }
}

class _DesktopFotter extends StatelessWidget {
  const _DesktopFotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [AppLogo(), Spacer(), Appmenus(), Spacer(), footerLined()],
    );
  }
}

class footerLined extends StatelessWidget {
  const footerLined({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _footerLinkedItem(onPressed: () {}, icon: AppIcon.youtube),
        _footerLinkedItem(onPressed: () {}, icon: AppIcon.github),
        _footerLinkedItem(onPressed: () {}, icon: AppIcon.likned),
        _footerLinkedItem(onPressed: () {}, icon: AppIcon.instagram),
      ],
    );
  }
}

class _footerLinkedItem extends StatelessWidget {
  const _footerLinkedItem({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
