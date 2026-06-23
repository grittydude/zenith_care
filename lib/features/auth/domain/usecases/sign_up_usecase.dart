import 'package:zenith_care/features/auth/domain/entities/app_user.dart';
import '../../../../core/constants/auth_error_fields.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/i_auth_repository.dart';

class SignUpUseCase {
  const SignUpUseCase(this._repository);
  final IAuthRepository _repository;

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<AppUser> execute({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final trimmedName = fullName.trim();
    final trimmedEmail = email.trim();

// FUll name validation
    if (trimmedName.isEmpty) {
      throw const ValidationFailure('Please enter your full name',
          field: AuthErrorFields.fullName);
    }

    final nameParts =
        trimmedName.split(' ').where((p) => p.isNotEmpty).toList();
    if (nameParts.length < 2) {
      throw const ValidationFailure('Please enter your first and last name',
          field: AuthErrorFields.fullName);
    }

    // EMail validation
    if (trimmedEmail.isEmpty) {
      throw const ValidationFailure('Please enter your email address',
          field: AuthErrorFields.email);
    }

    if (!_isValidEmail(trimmedEmail)) {
      throw const ValidationFailure('Please enter a valid email address',
          field: AuthErrorFields.email);
    }

// Password Validation
    if (password.isEmpty) {
      throw const ValidationFailure(
        field: AuthErrorFields.password,
        'Please enter a password.',
      );
    }
    if (password.length < 8) {
      throw const ValidationFailure(
        field: AuthErrorFields.password,
        'Please must be at least 8 characters long',
      );
    }

    // Password Validation
    if (confirmPassword.isEmpty) {
      throw const ValidationFailure(
        field: AuthErrorFields.password,
        'Please enter your password again',
      );
    }

    if (password != confirmPassword) {
      throw const ValidationFailure(
          field: AuthErrorFields.confirmPassword, 'Passwords do not match');
    }

    // ALl validation passed
    return _repository.signUpUpWithEmailAndPassword(
      email: trimmedEmail,
      password: password,
      fullName: trimmedName,
    );
  }
}
