import 'package:dummy_flutter_module/loan_module_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'browser_back_stub.dart' if (dart.library.html) 'browser_back_web.dart';
import 'loan_host_bridge.dart';

extension Nav on WidgetRef {
  void goTo(String location) => context.go(location);

  Future<T?> push<T>(String location) => context.push<T>(location);

  void pop({String fallback = "/loan"}) {
    if (context.canPop()) {
      context.pop();
      return;
    }
    try {
      read(loanHostBridgeProvider).exitToHost();
    } on Object {
      maybeBrowserBackOrGo(context, fallback);
    }
  }
}
