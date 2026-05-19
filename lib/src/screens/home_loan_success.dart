import 'package:dummy_flutter_module/loan_module_routes.dart';
import 'package:dummy_flutter_module/src/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoanHomeSuccess extends ConsumerWidget {
  const LoanHomeSuccess({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loan Success')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Loan success'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.pop(fallback: LoanModule.parentRoot),
              child: const Text('Back to Loan'),
            ),
          ],
        ),
      ),
    );
  }
}