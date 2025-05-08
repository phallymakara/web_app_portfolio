import 'package:flutter/material.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/styles/app_sizes.dart';
import 'package:portfolio/widgets/appBar/background_blur.dart';
import 'package:portfolio/widgets/appBar/my_app_bar.dart';
import 'package:portfolio/widgets/appBar/my_footer.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.slivers});
  final List<Widget> slivers;

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
                  ...slivers,
                  const SliverToBoxAdapter(child: MyFooter()),
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
