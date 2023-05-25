abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}

class AuthSignUpSuccess extends AuthState {}

class AuthSignUpFailure extends AuthState {
  final String message;

  AuthSignUpFailure({required this.message});
}

class AuthSignUpLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthLoginFailure extends AuthState {
  final String message;
  AuthLoginFailure({required this.message});
}

class AuthLoginLoading extends AuthState {}

class AuthLogoutSuccess extends AuthState {}

class AuthLogoutFailure extends AuthState {
  final String message;

  AuthLogoutFailure({required this.message});
}

class AuthLogoutLoading extends AuthState {}
