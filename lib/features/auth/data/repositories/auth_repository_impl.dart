import 'package:zenith_care/features/auth/data/datasources/supabase_auth_datasource.dart';
import 'package:zenith_care/features/auth/domain/entities/app_user.dart';
import 'package:zenith_care/features/auth/domain/repositories/i_auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final SupabaseAuthDatasource _datasource;

  const AuthRepositoryImpl(this._datasource);

  @override
  Stream<AppUser?> get authStateChanges => _datasource.authStateChanges;

  @override
  Future<AppUser?> get getCurrentUser async => _datasource.getCurrentUser();

  @override
  Future<AppUser> signUpUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) {
    return _datasource.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );
  }
}
