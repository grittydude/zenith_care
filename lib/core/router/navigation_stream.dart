import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_stream.g.dart';

class NavigationStream {
  final _controller = StreamController<void>.broadcast();

  Stream<void> get stream => _controller.stream;

  void notify() => _controller.add(null);

  void dispose() => _controller.close();
}

@riverpod
NavigationStream navigationStream(Ref ref) {
  final notifier = NavigationStream();
  ref.onDispose(notifier.dispose);
  return notifier;
}
