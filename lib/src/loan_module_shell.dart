import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../loan_module_routes.dart';
import 'navigation/loan_host_bridge.dart';

/// Embeds the loan module's [GoRouter] inside the host's Navigator 2.0 page.
class LoanModuleShell extends StatefulWidget {
  const LoanModuleShell({
    required this.location,
    required this.onLocationChanged,
    required this.onExit,
    super.key,
  });

  final String location;
  final ValueChanged<String> onLocationChanged;
  final VoidCallback onExit;

  @override
  State<LoanModuleShell> createState() => _LoanModuleShellState();
}

class _LoanModuleShellState extends State<LoanModuleShell> {
  late final LoanModuleRouter _router;

  @override
  void initState() {
    super.initState();
    _router = LoanModuleRouter(
      initialLocation: widget.location,
      onRouteChanged: widget.onLocationChanged,
    );
  }

  @override
  void didUpdateWidget(LoanModuleShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      _router.router.go(widget.location);
    }
  }

  @override
  void dispose() {
    _router.router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        loanHostBridgeProvider.overrideWithValue(
          LoanHostBridge(exitToHost: widget.onExit),
        ),
      ],
      child: Router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.router.routeInformationProvider,
        backButtonDispatcher: _router.router.backButtonDispatcher,
      ),
    );
  }
}