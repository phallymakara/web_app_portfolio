import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/styles/app_sizes.dart'; //

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -Insets.xxxl, //
      left: -(context.width / 2),
      child: Container(
        width: context.width * 2,
        height: context.height * 1.5,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft, // ✅ Main focus Top Left
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0), Colors.transparent],
            stops: [0.0, 0.4, 1.0],
            radius: 1.2,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 180, sigmaY: 180),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
