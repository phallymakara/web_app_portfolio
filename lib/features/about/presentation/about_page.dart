import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/widgets/app_scaffold.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/widgets/seo_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.insets.Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: Image.asset('name').image,
                ),
                const Gap(16),
                SEOText(
                  context.texts.aboutMe,
                  style: context.textStyle.titleLgBold,
                ),
                const Gap(16),
                SEOText(
                  context.texts.courseDescription,
                  style: context.textStyle.bodyMdMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
