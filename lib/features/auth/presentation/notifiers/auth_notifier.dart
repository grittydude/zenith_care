// ignore_for_file: inference_failure_on_instance_creation

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenith_care/core/errors/failures.dart';
import 'package:zenith_care/features/auth/data/providers/auth_providers.dart';
import 'package:zenith_care/features/auth/domain/entities/app_user.dart';

import '../../../../core/constants/auth_error_fields.dart';

part 'auth_notifier.g.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.user);

  final AppUser user;
}
class AuthSignupSuccess extends AuthState {
  const AuthSignupSuccess();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({
    this.errorMessage,
    this.errorField,
  });

  final String? errorMessage;
  final String? errorField;
}

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  StreamSubscription<AppUser?>? _authSubscription;
  final bool _isCleanSignOut = false;
  @override
  AuthState build() {
    _listenToAuthStream();

    ref.onDispose(() => _authSubscription?.cancel());

    return const AuthInitial();
  }

  void _listenToAuthStream() {
    final repository = ref.read(authResporitoryProvider);
    _authSubscription = repository.authStateChanges.listen(
      (user) {
        if (user != null) {
          state = AuthAuthenticated(user);
        } else {
          if (state is! AuthUnauthenticated || _isCleanSignOut) {
            state = const AuthUnauthenticated();
          }
        }
      },
      onError: (Object error) {
        state = const AuthUnauthenticated(
            errorMessage: 'Session error. Please sign in again');
      },
    );
  }

  Future<void> login(String email, String password) async {
    state = const AuthLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = const AuthUnauthenticated(
          errorMessage: 'Supabase isnot wired up yet',
          errorField: AuthErrorFields.general);
    } on AuthenticationFailure catch (e) {
      state = AuthUnauthenticated(
        errorMessage: e.message,
      );
    }
  }

  // Temporary UI-only method — removes when real Supabase auth is wired up
  Future<void> signInWithFakeUser() async {
    state = const AuthLoading();
    await Future.delayed(const Duration(seconds: 2));
    state = const AuthAuthenticated(
      AppUser(
        id: 'fake-user-001',
        email: 'ikeys@zenithcare.com',
        fullName: 'Ikeys',
      ),
    );
    // GoRouter redirect detects AuthAuthenticated and navigates to /home
    // automatically. No context.go() needed here.
  }

  // ---------------------Signup -------------------

  Future<void> signUp(
    String fullName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    state = const AuthLoading();
    try {
      final usecase = ref.read(signUpUseCaseProvider);
      await usecase.execute(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      state = const AuthSignupSuccess();
    } on ValidationFailure catch (e) {
      //Field-specific validation error
      state = AuthUnauthenticated(
        errorMessage: e.message,
        errorField: e.field,
      );
    } on EmailAlreadyInUseFailure catch (e) {
      state = AuthUnauthenticated(
        errorMessage: e.message,
        errorField: AuthErrorFields.email,
      );
    } on NetworkFailure catch (e) {
      state = AuthUnauthenticated(
        errorMessage: e.message,
      );
    } on AuthenticationFailure catch (e) {
      state = AuthUnauthenticated(
        errorMessage: e.message,
      );
    }
  }

  Future<void> logout() async {
    state = const AuthUnauthenticated();
  }
}
