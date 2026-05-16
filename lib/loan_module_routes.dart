import 'package:go_router/go_router.dart';
import 'src/screens/home_load_approve.dart';
import 'src/screens/loan_home_screen.dart';

class LoanModule {
  static List<RouteBase> get routes => [
        GoRoute(
          path: '/loan',
          builder: (_, __) => const LoanHomeScreen(),
        ),
        GoRoute(
          path: '/loan/approve',
          builder: (_, __) => const LoanHomeApproved(),
        ),
      ];
}
