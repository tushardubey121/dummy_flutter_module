import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

void maybeBrowserBackOrGo(BuildContext context, String fallback) {
  context.go(fallback);
}
