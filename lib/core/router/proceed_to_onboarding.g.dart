// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proceed_to_onboarding.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProceedToOnboarding)
final proceedToOnboardingProvider = ProceedToOnboardingProvider._();

final class ProceedToOnboardingProvider
    extends $NotifierProvider<ProceedToOnboarding, bool> {
  ProceedToOnboardingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'proceedToOnboardingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$proceedToOnboardingHash();

  @$internal
  @override
  ProceedToOnboarding create() => ProceedToOnboarding();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$proceedToOnboardingHash() =>
    r'b3c716fff5c21e5acbcc4cf9c645cd4ac88eb190';

abstract class _$ProceedToOnboarding extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
