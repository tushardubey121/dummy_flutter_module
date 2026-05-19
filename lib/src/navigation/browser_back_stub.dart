import 'package:go_router/go_router.dart';

void maybeBrowserBackOrGo(GoRouter context, String fallback) {
  context.go(fallback);
}
