import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mc_crud_test/presentation/page/home/home_page.dart';
import 'package:mc_crud_test/presentation/page/splash/splash_page.dart';

@LazySingleton()
class Routing {
  static const String splashPage = '/';
  static const String homePage = '/home';
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <GoRoute>[
      _buildRoute(
        path: splashPage,
        name: splashPage,
        page: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),
      _buildRoute(
        path: homePage,
        name: homePage,
        page: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
    ],
  );

  GoRoute _buildRoute({
    required String path,
    required String name,
    required Widget Function(
      BuildContext context,
      GoRouterState state,
    )
        page,
    GoRouterRedirect? redirect,
  }) {
    return GoRoute(
      path: path,
      name: name,
      redirect: redirect,
      builder: page,
    );
  }
}
