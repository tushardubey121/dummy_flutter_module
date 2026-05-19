import 'package:go_router/go_router.dart';
import 'package:web/web.dart';

void maybeBrowserBackOrGo(GoRouter context, String fallback) {
  if (window.history.length > 1) {
    window.history.back();
  } else {
    context.go(fallback);
  }
}
