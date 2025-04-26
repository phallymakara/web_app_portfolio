import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/widgets/appBar/drawer_menu.dart';

class AppBarDrawerIcon extends ConsumerStatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  ConsumerState<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends ConsumerState<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOpen = ref.watch(drawerMenuControllerProvider);

    ref.listen(drawerMenuControllerProvider, (previous, next) {
      if (next) {
        controller.forward();
        ref.read(drawerMenuControllerProvider.notifier).open();
      } else {
        controller.reverse();
        ref.read(drawerMenuControllerProvider.notifier).close();
      }
    });

    return IconButton(
      onPressed: () {
        if (!isOpen) {
          ref.read(drawerMenuControllerProvider.notifier).open();
        } else {
          ref.read(drawerMenuControllerProvider.notifier).close();
        }
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
    );
  }
}
