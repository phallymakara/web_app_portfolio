import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/features/home/presentation/experience_body.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_course_list.dart';
import 'package:portfolio/features/home/presentation/testimony_list.dart';
import 'package:portfolio/styles/app_sizes.dart';
import 'package:portfolio/widgets/appBar/background_blur.dart';
import 'package:portfolio/widgets/appBar/my_app_bar.dart';
import 'package:portfolio/widgets/appBar/my_footer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✨ Blur first
          const Positioned.fill(child: BackgroundBlur()),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: Insets.maxWidth),
              padding: EdgeInsets.only(top: context.insets.appBarH),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.insets.Padding,
                      ),
                      child: HeroWidget(),
                    ),
                  ),
                  SliverGap(context.insets.gap),
                  SliverToBoxAdapter(child: HomeCourseList()),
                  SliverGap(context.insets.gap),
                  SliverToBoxAdapter(child: ExperienceBody()),
                  SliverGap(context.insets.gap),
                  TestimonyList(),
                  SliverToBoxAdapter(child: MyFooter()),
                ],
              ),
            ),
          ),

          // 🌟 AppBar and other contents
          const MyAppBar(),
        ],
      ),
    );
  }
}
