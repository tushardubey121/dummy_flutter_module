import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Lets module screens pop back to the host Navigator 2.0 stack.
class LoanHostBridge {
  const LoanHostBridge({required this .exitToHost});

  final VoidCallback exitToHost;
}

final loanHostBridgeProvider = Provider<LoanHostBridge>(
  (_) => throw UnimplementedError(
    'LoanHostBridge must be provided by LoanModuleShell when embedded in the host app.',
  ),
);
