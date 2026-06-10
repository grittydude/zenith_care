import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'proceed_to_onboarding.g.dart';

@riverpod
class ProceedToOnboarding extends _$ProceedToOnboarding {
  @override
  bool build() => false;

  void proceed() {
    state = true;
  }

  void reset() {
    state = false;
  }
}
