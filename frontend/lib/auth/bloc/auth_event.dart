abstract class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class UserLoginEvent extends AuthEvent {
  final String email;
  final String password;

  UserLoginEvent({required this.email, required this.password});
}

class UserSignUpEvent extends AuthEvent {
  final String name;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
  final String role;

  UserSignUpEvent(
      {required this.name,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.role});
}

// logout
class UserLogoutEvent extends AuthEvent {
  UserLogoutEvent();
}

//delete account
class UserDeleteAccountEvent extends AuthEvent {}

// user login success
class UserLoginSuccessEvent extends AuthEvent {
  final String role;

  UserLoginSuccessEvent({required this.role});
}

// user login error
class UserLoginErrorEvent extends AuthEvent {
  final String error;

  UserLoginErrorEvent({required this.error});
}

// user sign up success
class UserSignUpSuccessEvent extends AuthEvent {
  final String role;

  UserSignUpSuccessEvent({required this.role});
}

// user sign up error
class UserSignUpErrorEvent extends AuthEvent {
  final String error;

  UserSignUpErrorEvent({required this.error});
}

// user logout success
class UserLogoutSuccessEvent extends AuthEvent {}

// user logout error
class UserLogoutErrorEvent extends AuthEvent {
  final String error;

  UserLogoutErrorEvent({required this.error});
}

// user delete account success
class UserDeleteAccountSuccessEvent extends AuthEvent {}

// user delete account error
class UserDeleteAccountErrorEvent extends AuthEvent {
  final String error;

  UserDeleteAccountErrorEvent({required this.error});
}
