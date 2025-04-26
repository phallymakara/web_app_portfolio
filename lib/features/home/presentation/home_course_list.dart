import 'package:flutter/material.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/features/course/presentation/course_item.dart';

class HomeCourseList extends StatelessWidget {
  const HomeCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_HomeCourseListDesktop()]);
  }
}

class _HomeCourseListDesktop extends StatelessWidget {
  const _HomeCourseListDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.Padding),
      child: Row(
        children: [
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
        ],
      ),
    );
  }
}
