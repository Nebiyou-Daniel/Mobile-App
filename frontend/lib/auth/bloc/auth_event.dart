abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String role;

  AuthSignUpEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.role});
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  final String role;

  AuthLoginEvent(
      {required this.email, required this.password, required this.role});
}

// logout
class AuthLogoutEvent extends AuthEvent {
  AuthLogoutEvent();
}

//delete account
class AuthDeleteSelfAccountEvent extends AuthEvent {}

class AuthDeleteAccountByIdEvent extends AuthEvent {
  final int id;
  final String role;

  AuthDeleteAccountByIdEvent({required this.id, required this.role});
}