import 'package:flutter/material.dart';
import 'package:metronome/modules/home_page/home_page.dart';
import 'package:metronome/modules/sequencer/sequencer.dart';

class AppRouter {
  static final allRoutes = [
    AppRoutes.homepage,
    AppRoutes.sequencer,
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    AppRoute appRoute = allRoutes.firstWhere(
      (appRoute) => appRoute.route == routeSettings.name,
    );

    return PageRouteBuilder<void>(
      settings: routeSettings,
      pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: appRoute.build(
          context,
          routeSettings.arguments,
        ),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

class AppRoute {
  const AppRoute({
    required this.build,
    required this.route,
  });

  final Widget Function(BuildContext context, Object? arguments) build;
  final String route;
}

class AppRoutes {
  static final homepage = AppRoute(
    build: (_, __) => HomePage(),
    route: '/',
  );
  static final sequencer = AppRoute(
    build: (_, __) => Sequencer(),
    route: '/sequencer',
  );
}
