import 'package:dummy_flutter_module/src/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoanHomeScreen extends ConsumerWidget {
  const LoanHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loan Module')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => ref.pop(),
              child: const Text('Back to Main App'),
            ),
            ElevatedButton(
              onPressed: () => ref.goTo('/loan/approve'),
              child: const Text('Loan approve'),
            ),
          ],
        ),
      ),
    );
  }
}