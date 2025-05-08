import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/app_scaffold.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/features/course/presentation/course_item.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(context.insets.Padding),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  context.mq.size.width ~/ 300 >= 3
                      ? 3
                      : context.mq.size.width ~/ 300,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return const CourseItem();
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
