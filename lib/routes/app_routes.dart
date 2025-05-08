import 'package:go_router/go_router.dart';
import 'package:portfolio/features/about/presentation/about_page.dart';
import 'package:portfolio/features/blog/presentation/blog_page.dart';
import 'package:portfolio/features/course/presentation/course_page.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';

class Routes {
  static const String home = '/';
  static const String courses = '/courses';
  static const String blog = '/blog';
  static const String aboutMe = '/about';
}

class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: MyHomePage()),
      ),
      GoRoute(
        path: Routes.courses,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: CoursePage()),
      ),
      GoRoute(
        path: Routes.blog,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: BlogPage()),
      ),
      GoRoute(
        path: Routes.aboutMe,
        pageBuilder:
            (context, state) => const NoTransitionPage(child: AboutPage()),
      ),
    ],
  );
}
