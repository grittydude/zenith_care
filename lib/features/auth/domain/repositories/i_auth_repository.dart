import 'package:zenith_care/features/auth/domain/entities/app_user.dart';

abstract interface class IAuthRepository {
  //Signup a new user with email and password
  // ON success: return the newly created user AppUser
  //On Failure: throw an AppFailure describing what went wrong

  Future<AppUser> signUpUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  });

  Future<AppUser?> get getCurrentUser;

  Stream<AppUser?> get authStateChanges;

  Future<void> signOut();
}
