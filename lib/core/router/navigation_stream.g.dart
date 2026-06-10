// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(navigationStream)
final navigationStreamProvider = NavigationStreamProvider._();

final class NavigationStreamProvider extends $FunctionalProvider<
    NavigationStream,
    NavigationStream,
    NavigationStream> with $Provider<NavigationStream> {
  NavigationStreamProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'navigationStreamProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$navigationStreamHash();

  @$internal
  @override
  $ProviderElement<NavigationStream> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NavigationStream create(Ref ref) {
    return navigationStream(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavigationStream value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NavigationStream>(value),
    );
  }
}

String _$navigationStreamHash() => r'4edfcaaba2626cf78d009d6ac689d42bb735d6bf';
