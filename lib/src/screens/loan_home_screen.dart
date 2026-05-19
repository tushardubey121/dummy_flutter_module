import 'package:dummy_flutter_module/loan_module_routes.dart';
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => ref.pop(),
                child: const Text('Back to Main App'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ref.push(LoanModuleRouter.approve),
                child: const Text('Loan approve'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
