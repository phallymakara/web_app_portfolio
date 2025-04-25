import 'package:flutter/material.dart';
import 'package:portfolio/widgets/appBar/my_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyAppBar());
  }
}
