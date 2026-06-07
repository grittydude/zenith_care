// ignore_for_file: inference_failure_on_instance_creation

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenith_care/core/errors/failures.dart';
import 'package:zenith_care/features/auth/domain/entities/app_user.dart';

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

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({
    this.errorMessage,
    this.errorField,
  });

  final String? errorMessage;
  final String? errorField;
}

abstract final class AuthErrorFields {
  static const String email = 'email';
  static const String password = 'password';
  static const String fullname = 'fullname';
  static const String confirmPassword = 'confirmPassword';
  static const String genral = 'general';
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    Future.microtask(() {
      if (state is AuthInitial) {
        state = const AuthUnauthenticated();
      }
    });
    return const AuthInitial();
  }

  Future<void> login(String email, String password) async {
    state = const AuthLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = const AuthUnauthenticated(
          errorMessage: 'Supabase isnot wired up yet',
          errorField: AuthErrorFields.genral);
    } on AuthenticationFailure catch (e) {
      state = AuthUnauthenticated(
        errorMessage: e.message,
      );
    }
  }

  Future<void> register(String email, String password, String fullName) async {
    state = const AuthLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = const AuthUnauthenticated(
          errorMessage: 'Supabase isnot wired up yet',
          errorField: AuthErrorFields.genral);
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
