

abstract class AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({required this.email, required this.password});
}

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phoneNumber;

  AuthSignUp({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
  });
}

class AuthLogout extends AuthEvent {
  AuthLogout();
}
