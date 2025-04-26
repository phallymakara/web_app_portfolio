import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/styles/app_sizes.dart';
import 'package:portfolio/widgets/styled_button.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButtonOne(title: context.texts.courses),
        Gap(Insets.lg),
        OutlineButtonOne(title: context.texts.cooperationRequest),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButtonOne(title: context.texts.courses),
        ),
        Gap(Insets.lg),
        SizedBox(
          width: double.infinity,
          child: OutlineButtonOne(title: context.texts.cooperationRequest),
        ),
      ],
    );
  }
}
