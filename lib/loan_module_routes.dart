import 'package:dummy_flutter_module/src/screens/home_loan_success.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/screens/home_load_approve.dart';
import 'src/screens/loan_home_screen.dart';

class LoanModule {
  static const String parentRoot = '/loan';
  static const String approve = '$parentRoot/approve';
  static const String success = '$approve/success';

  static List<RouteBase> get routes => [
        GoRoute(
          path: parentRoot,
          builder: (_, __) => const LoanHomeScreen(),
        ),
        GoRoute(
          path: approve,
          builder: (_, __) => const LoanHomeApproved(),
        ),
        GoRoute(
          path: success,
          builder: (_, __) => const LoanHomeSuccess(),
        ),
      ];

  /// Nested [GoRouter] for use inside a host Navigator 2.0 page.
  static GoRouter createRouter({
    required String initialLocation,
    ValueChanged<String>? onRouteChanged,
  }) {
    final router = GoRouter(
      initialLocation: initialLocation,
      routes: routes,
    );

    if (onRouteChanged != null) {
      router.routerDelegate.addListener(() {
        final location = router.routeInformationProvider.value.uri.toString();
        onRouteChanged(location);
      });
    }

    return router;
  }
}
