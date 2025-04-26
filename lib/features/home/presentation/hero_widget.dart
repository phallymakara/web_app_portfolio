import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/features/home/presentation/hero_buttons.dart';
import 'package:portfolio/features/home/presentation/hero_image.dart';
import 'package:portfolio/features/home/presentation/hero_text.dart';
import 'package:portfolio/styles/app_sizes.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Flutter'),
        context.isDesktop || context.isTablet ? _largeHero() : _smallHero(),
      ],
    );
  }
}

class _largeHero extends StatelessWidget {
  const _largeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: HeroImage()),
        Gap(Insets.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HeroText(), Gap(Insets.xs), const LargeHeroButtons()],
          ),
        ),
      ],
    );
  }
}

class _smallHero extends StatelessWidget {
  const _smallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 140),
          child: HeroImage(),
        ),
        Gap(Insets.xs),
        HeroText(),
        Gap(Insets.xs),
        const SmallHeroButtons(),
      ],
    );
  }
}
