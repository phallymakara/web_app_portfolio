import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/extension.dart';
import 'package:portfolio/features/testimoni/presentation/testimoni_item.dart';

class TestimonyList extends StatelessWidget {
  const TestimonyList({super.key});

  @override
  Widget build(BuildContext context) {
    return _DesktopTestimony();
  }
}

class _DesktopTestimony extends StatelessWidget {
  const _DesktopTestimony({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return TestimonyItem();
      }, childCount: 10),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
      ),
    );
  }
}
