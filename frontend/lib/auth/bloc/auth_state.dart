import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{}

class AuthInitial extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthSignUpSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthSignUpFailure extends AuthState {
  final String message;

  AuthSignUpFailure({required this.message});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthSignUpLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoginSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoginFailure extends AuthState {
  final String message;
  AuthLoginFailure({required this.message});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLoginLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLogoutSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLogoutFailure extends AuthState {
  final String message;

  AuthLogoutFailure({required this.message});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthLogoutLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
