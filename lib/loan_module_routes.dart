import 'package:dummy_flutter_module/src/screens/home_loan_success.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/screens/home_load_approve.dart';
import 'src/screens/loan_home_screen.dart';

/// A class that encapsulates the GoRouter instance and exposes its delegate and parser.
/// This allows the host app to integrate this module's navigation into its own
/// Navigator 2.0 setup.
class LoanModuleRouter {
  final GoRouter router;

  /// The router delegate for the loan module.
  GoRouterDelegate get routerDelegate => router.routerDelegate;

  /// The route information parser for the loan module.
  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  LoanModuleRouter({
    required String initialLocation,
    ValueChanged<String>? onRouteChanged,
  }) : router = GoRouter(
          initialLocation: initialLocation,
          routes: routes,
        ) {
    if (onRouteChanged != null) {
      router.routerDelegate.addListener(() {
        final location = router.routeInformationProvider.value.uri.toString();
        onRouteChanged(location);
      });
    }
  }

  static const String parentRoot = '/loan';
  static const String approve = '$parentRoot/approve';
  static const String success = '$approve/success';

  static final List<RouteBase> routes = [
    GoRoute(
      path: parentRoot,
      name: parentRoot,
      builder: (_, __) => const LoanHomeScreen(),
    ),
    GoRoute(
      path: approve,
      name: approve,
      builder: (_, __) => const LoanHomeApproved(),
    ),
    GoRoute(
      path: success,
      name: success,
      builder: (_, __) => const LoanHomeSuccess(),
    ),
  ];
}