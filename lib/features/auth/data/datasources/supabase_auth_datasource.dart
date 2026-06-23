import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenith_care/core/errors/failures.dart';
import 'package:zenith_care/features/auth/domain/entities/app_user.dart';

class SupabaseAuthDatasource {
  final SupabaseClient _client;
  const SupabaseAuthDatasource(this._client);

  //Signup
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      debugPrint('email: $email');
      debugPrint('password: $password');
      debugPrint('fullName: $fullName');
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );
      debugPrint('response: $response');

      if (response.user == null) {
        throw const ServerFailure('Registration failed. Please try again.');
      }

      return _mapUser(response.user!);
    } on AuthException catch (e) {
      debugPrint('Supabase Auth Error');
      debugPrint('message ${e.message}');
      debugPrint('Status code ${e.statusCode}');

      throw _mapAuthException(e);
    } on SocketException {
      throw const NetworkFailure();
    } on TimeoutException {
      throw const TimeoutFailure();
    }
  }

  //Signout

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } on AuthException catch (e) {
      throw _mapAuthException(e);
    }
  }

  // Get Current user
  AppUser? getCurrentUser() {
    final user = _client.auth.currentUser;
    return user == null ? null : _mapUser(user);
  }

  // AUth Stream
  Stream<AppUser?> get authStateChanges {
    return _client.auth.onAuthStateChange.map((event) {
      final user = event.session?.user;
      return user == null ? null : _mapUser(user);
    });
  }

  // helper to convert supabase user to our app user
  AppUser _mapUser(User supabaseUser) {
    return AppUser(
      id: supabaseUser.id,
      email: supabaseUser.email ?? '',
      fullName: supabaseUser.userMetadata?['full_name'] as String?,
      isEmailVerified: supabaseUser.emailConfirmedAt != null,
    );
  }

  AppFailure _mapAuthException(AuthException e) {
    final message = e.message.toLowerCase();

    if (message.contains('Invlid login credentials') ||
        message.contains('Invlid email or password') ||
        message.contains('email not confirmed')) {
      return const InvalidCredentialsFailure();
    }

    if (message.contains('user already registered') ||
        message.contains('email address is already registered') ||
        message.contains('already been registered')) {
      return const EmailAlreadyInUseFailure();
    }

    if (message.contains('password should be at least') ||
        message.contains('weak password')) {
      return const WeakPasswordFailure();
    }

    if (message.contains('jwt expired') ||
        message.contains('invalid jwt') ||
        message.contains('session_not_found')) {
      return const SessionExpiredFailure();
    }

    if (e.statusCode == '429') {
      return const ServerFailure('Please wait a few minutes and try again');
    }

    //unknown error
    return UnknownAuthFailure(
      'AUthentication error. Please try again',
      originalError: e,
    );
  }
}
