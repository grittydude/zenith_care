import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenith_care/features/auth/data/datasources/supabase_auth_datasource.dart';

import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../repositories/auth_repository_impl.dart';

part 'auth_providers.g.dart';

@riverpod
SupabaseClient supabaseClient(Ref ref) {
  return Supabase.instance.client;
}

//provider for the auth data source
@riverpod
SupabaseAuthDatasource supabaseAuthDatasource(Ref ref) {
  return SupabaseAuthDatasource(ref.watch(supabaseClientProvider));
}

// Auth Repository
@riverpod
IAuthRepository authResporitory(Ref ref) {
  return AuthRepositoryImpl(ref.watch(supabaseAuthDatasourceProvider));
}

//Signup usecase
@riverpod
SignUpUseCase signUpUseCase(Ref ref) {
  return SignUpUseCase(ref.watch(authResporitoryProvider));
}
