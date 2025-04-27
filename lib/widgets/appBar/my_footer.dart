import 'package:flutter/material.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/widgets/appBar/my_app_bar.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.Padding),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFotter() : _PhoneFotter(),
          const Divider(height: 24),
          Text('Flutter '),
        ],
      ),
    );
  }
}

class _PhoneFotter extends StatelessWidget {
  const _PhoneFotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [AppLogo(), SmallAppMenu()]);
  }
}

class _DesktopFotter extends StatelessWidget {
  const _DesktopFotter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [AppLogo(), Spacer(), Appmenus(), Spacer()]);
  }
}
