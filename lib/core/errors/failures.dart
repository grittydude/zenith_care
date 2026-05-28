sealed class AppFailure implements Exception {
  final String message;
  final Object? originalError;

  const AppFailure(this.message, {this.originalError});

  @override
  String toString() => '{$runtimeType: $message}';

}
// Network Level Failures
class NetworkFailure extends AppFailure {
  const NetworkFailure()
    : super('No internet connection. please check your network and try again');
}

class ServerFailure extends AppFailure {
  const ServerFailure()
    :super('An error occurred while communicating with the server. Please try again later.');
}

class TimeoutFailure extends AppFailure {
  const TimeoutFailure()
    : super('The request timed out. Please check your internet connection and try again.');
}


// Auth Level Failures
sealed class AuthenticationFailure extends AppFailure {
  const AuthenticationFailure(super.message, {super.originalError});
}

class InvalidCredentialsFailure extends AuthenticationFailure {
  const InvalidCredentialsFailure()
    : super('Invalid credentials provided. Please check your username and password and try again.');
}

class EmailAlreadyInUseFailure extends AuthenticationFailure {
  const EmailAlreadyInUseFailure()
    : super('The email address is already in use. Please use a different email address.');
}

class WeakPasswordFailure extends AuthenticationFailure {
  const WeakPasswordFailure()
    : super('The password provided is too weak. Please choose a stronger password.');
}

class SessionExpiredFailure extends AuthenticationFailure {
  const SessionExpiredFailure()
    : super('Your session has expired. Please log in again.');
}

class UnknownAuthFailure extends AuthenticationFailure {
  const UnknownAuthFailure()
    : super('An unknown authentication error occurred. Please try again later.');
}

class UserNotFoundFailure extends AuthenticationFailure {
  const UserNotFoundFailure()
    : super('No user found with the provided credentials. Please check your username and try again.');
}



//dart run build_runner build --delete-conflicting-outputs

//dart run build_runner watch --delete-conflicting-outputs

//dart run build_runner clean
//dart run build_runner build --delete-conflicting-outputs
