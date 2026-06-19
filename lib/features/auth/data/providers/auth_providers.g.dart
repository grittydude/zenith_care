// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseClient)
final supabaseClientProvider = SupabaseClientProvider._();

final class SupabaseClientProvider
    extends $FunctionalProvider<SupabaseClient, SupabaseClient, SupabaseClient>
    with $Provider<SupabaseClient> {
  SupabaseClientProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'supabaseClientProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$supabaseClientHash();

  @$internal
  @override
  $ProviderElement<SupabaseClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseClient create(Ref ref) {
    return supabaseClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseClient>(value),
    );
  }
}

String _$supabaseClientHash() => r'834a58d6ae4b94e36f4e04a10d8a7684b929310e';

@ProviderFor(supabaseAuthDatasource)
final supabaseAuthDatasourceProvider = SupabaseAuthDatasourceProvider._();

final class SupabaseAuthDatasourceProvider extends $FunctionalProvider<
    SupabaseAuthDatasource,
    SupabaseAuthDatasource,
    SupabaseAuthDatasource> with $Provider<SupabaseAuthDatasource> {
  SupabaseAuthDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'supabaseAuthDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$supabaseAuthDatasourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseAuthDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseAuthDatasource create(Ref ref) {
    return supabaseAuthDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseAuthDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseAuthDatasource>(value),
    );
  }
}

String _$supabaseAuthDatasourceHash() =>
    r'5103643113fce6b101a6073e56f6d5ec96055451';

@ProviderFor(authResporitory)
final authResporitoryProvider = AuthResporitoryProvider._();

final class AuthResporitoryProvider extends $FunctionalProvider<IAuthRepository,
    IAuthRepository, IAuthRepository> with $Provider<IAuthRepository> {
  AuthResporitoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authResporitoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authResporitoryHash();

  @$internal
  @override
  $ProviderElement<IAuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRepository create(Ref ref) {
    return authResporitory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRepository>(value),
    );
  }
}

String _$authResporitoryHash() => r'fc9669b2e0ef34508559bae2edf91626576c2d0a';

@ProviderFor(signUpUseCase)
final signUpUseCaseProvider = SignUpUseCaseProvider._();

final class SignUpUseCaseProvider
    extends $FunctionalProvider<SignUpUseCase, SignUpUseCase, SignUpUseCase>
    with $Provider<SignUpUseCase> {
  SignUpUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signUpUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signUpUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignUpUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignUpUseCase create(Ref ref) {
    return signUpUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpUseCase>(value),
    );
  }
}

String _$signUpUseCaseHash() => r'c40a54bd7f3c39a077de8e2a259b86534cc39b68';
