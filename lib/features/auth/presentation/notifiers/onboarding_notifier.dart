import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_notifier.g.dart';

const _kOnboardingCompleteKey = 'onboarding_complete';

@riverpod
Future<SharedPreferences> sharedPreference(Ref ref) =>
    SharedPreferences.getInstance();

@riverpod
Future<bool> hasCompletedOnboarding(Ref ref) async {
  final prefs = await ref.watch(sharedPreferenceProvider.future);
  return prefs.getBool(_kOnboardingCompleteKey) ?? false;
}

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  int build() => 0;

  Future<void> nextPage({required int totalPages}) async {
    if (state < totalPages - 1) {
      state = state + 1;
    } else {
      await _markComplete();
    }
  }

  void jumpToPage(int index) => state = index;

  Future<void> _markComplete() async {
    final prefs = await ref.watch(sharedPreferenceProvider.future);
    await prefs.setBool(_kOnboardingCompleteKey, true);
    debugPrint('✅ Onboarding complete written to SharedPreferences');
    ref.invalidate(hasCompletedOnboardingProvider);
    debugPrint('✅ hasCompletedOnboardingProvider invalidated');
  }

  Future<void> skip() async => _markComplete();
}
