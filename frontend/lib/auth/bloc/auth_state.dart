import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

// Logging out
class AuthLoggingOut extends AuthState {
  @override
  List<Object?> get props => [];
}

// logout success
class AuthLogoutSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

// logout Erroe
class AuthLogoutError extends AuthState {
  @override
  List<Object?> get props => [];
}

// logging in
class AuthLoggingIn extends AuthState {
  @override
  List<Object?> get props => [];
}

// login success
class AuthLoginSuccess extends AuthState {
  final String role;
  AuthLoginSuccess({required this.role});

  @override
  List<Object?> get props => [];
}

// login Error
class AuthLoginError extends AuthState {
  final String error;

  AuthLoginError({required this.error});

  @override
  List<Object?> get props => [];
}

// AuthSigningUp
class AuthSigningUp extends AuthState {
  @override
  List<Object?> get props => [];
}

// sign up success
class AuthSignupSuccess extends AuthState {
  final String role;
  AuthSignupSuccess({required this.role});

  @override
  List<Object?> get props => [];
}

// signup error
class AuthSignupError extends AuthState {
  final String error;
  AuthSignupError({required this.error});
  @override
  List<Object?> get props => [];
}

// delete account ...
class AuthDeletingAccount extends AuthState {
  @override
  List<Object?> get props => [];
}

// delete account success
class AuthDeleteAccountSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

// delete account error
class AuthDeleteAccountError extends AuthState {
  final String error;

  AuthDeleteAccountError({required this.error});

  @override
  List<Object?> get props => [];
}
