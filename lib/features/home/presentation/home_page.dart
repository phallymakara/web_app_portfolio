import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/hero_widget.dart';
import 'package:portfolio/features/home/presentation/home_course_list.dart';
import 'package:portfolio/widgets/appBar/background_blur.dart';
import 'package:portfolio/widgets/appBar/my_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✨ Blur first
          const Positioned.fill(child: BackgroundBlur()),
          SingleChildScrollView(
            child: Column(children: [HeroWidget(), HomeCourseList()]),
          ),

          // 🌟 AppBar and other contents
          const MyAppBar(),
        ],
      ),
    );
  }
}
