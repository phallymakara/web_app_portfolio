import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app_text_styles.dart';
import 'package:portfolio/constant/app_menu_list.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/shared/app_theme_controller.dart';
import 'package:portfolio/styles/app_sizes.dart';
import 'package:portfolio/widgets/appBar/app_bar_drawer_icon.dart';
import 'package:portfolio/widgets/appBar/background_blur.dart';
import 'package:portfolio/widgets/appBar/drawer_menu.dart';
import 'package:portfolio/widgets/language_switch.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const BackgroundBlur(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.center,

              // color: (context.theme.appBarTheme.backgroundColor ?? Colors.white)
              //     .withOpacity(0.6),
              color: Colors.transparent,
              height: context.insets.appBarH,
              padding: EdgeInsets.symmetric(horizontal: context.insets.Padding),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Insets.maxWidth),
                child: Row(
                  children: [
                    AppLogo(),
                    Spacer(),
                    if (context.isDesktop) Appmenus(),
                    Spacer(),
                    LanguageSwitch(),
                    ThemeToggle(),
                    if (!context.isDesktop) AppBarDrawerIcon(),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('portfolio', style: context.textStyle.titleLgBold);
  }
}

class Appmenus extends StatelessWidget {
  const Appmenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          AppMenuList.getItems(context)
              .map(
                (AppMenu e) => LargeAppBarMenuItem(
                  texts: e.title,
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                  onTap: () {
                    context.go(e.path);
                  },
                ),
              )
              .toList(),
    );
  }
}

class SmallAppMenu extends StatelessWidget {
  const SmallAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          AppMenuList.getItems(context)
              .map(
                (AppMenu e) => LargeAppBarMenuItem(
                  texts: e.title,
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                  onTap: () {
                    context.go(e.path);
                  },
                ),
              )
              .toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.texts,
    required this.isSelected,
    required this.onTap,
  });
  final String texts;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.xs,
        ),
        child: Text(
          texts,
          style: SmallTextStyles().bodyLgMedium.copyWith(
            color:
                isSelected
                    ? context.colorScheme.onBackground
                    : context.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final State = ref.watch(appThemeControllerProvider);
    return Switch(
      value: State.value == ThemeMode.dark,
      onChanged: (value) {
        ref
            .read(appThemeControllerProvider.notifier)
            .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
