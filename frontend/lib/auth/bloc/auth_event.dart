abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}

class AuthSignUpEvent extends AuthEvent {
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String role;

  AuthSignUpEvent(
      {required this.name,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.role});
}

// logout
class AuthLogoutEvent extends AuthEvent {
  AuthLogoutEvent();
}

//delete account
class AuthDeleteAccountEvent extends AuthEvent {}

// Auth login success
class AuthLoginSuccessEvent extends AuthEvent {
  final String role;

  AuthLoginSuccessEvent({required this.role});
}

// Auth login error
class AuthLoginErrorEvent extends AuthEvent {
  final String error;

  AuthLoginErrorEvent({required this.error});
}

// Auth sign up success
class AuthSignUpSuccessEvent extends AuthEvent {
  final String role;

  AuthSignUpSuccessEvent({required this.role});
}

// Auth sign up error
class AuthSignUpErrorEvent extends AuthEvent {
  final String error;

  AuthSignUpErrorEvent({required this.error});
}

// Auth logout success
class AuthLogoutSuccessEvent extends AuthEvent {}

// Auth logout error
class AuthLogoutErrorEvent extends AuthEvent {
  final String error;

  AuthLogoutErrorEvent({required this.error});
}

// Auth delete account success
class AuthDeleteAccountSuccessEvent extends AuthEvent {}

// Auth delete account error
class AuthDeleteAccountErrorEvent extends AuthEvent {
  final String error;

  AuthDeleteAccountErrorEvent({required this.error});
}
