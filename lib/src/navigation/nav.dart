import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'browser_back_stub.dart' if (dart.library.html) 'browser_back_web.dart';
import 'loan_host_bridge.dart';

extension Nav on WidgetRef {
  // Renamed from `goTo` to `push` for clarity, as it uses GoRouter.push().
  Future<T?> push<T extends Object?>(String location) => GoRouter.of(context).push<T>(location);
  // Future<T?> push<T>(String location) => GoRouter.of(context).push<T>(location);

  void pop({String fallback = "/loan"}) {
    print("-----> ${GoRouter.of(context).routerDelegate.canPop()}");
    if (GoRouter.of(context).canPop()) {
      GoRouter.of(context).pop();
      return;
    }
    try {
      read(loanHostBridgeProvider).exitToHost();
    } on Object {
      maybeBrowserBackOrGo(GoRouter.of(context), fallback);
    }
  }
}
