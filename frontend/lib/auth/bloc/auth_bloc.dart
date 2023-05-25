import 'package:frontend/auth/bloc/auth_event.dart';
import 'package:frontend/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../User/Model/user_profile.dart';
import '../data_provider/api_data_providor.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    // on<AuthInitialEvent>((event, emit) {
    //   emit(AuthInitial());
    // });

    // logging in ...
    on<UserLoginEvent>((event, emit) {
      // ...loggin in ...
      emit(AuthLoggingIn());
      // ... try logging in
      apiDataProvider
          .login(email: event.email, password: event.password)
          .then((user) {
        emit(AuthLoginSuccess(user: user));
      }).catchError((error) {
        emit(AuthLoginError(error: error.toString()));
      });
    });

    // login success
    on<UserLoginSuccessEvent>((event, emit) {
      emit(AuthLoginSuccess(user: event.user as User));
    });

    // login Error
    on<UserLoginErrorEvent>((event, emit) {
      emit(AuthLoginError(error: event.error));
    });

    // logging out ...
    on<UserLogoutEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // logout Error
    on<UserLogoutEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // logout success
    on<UserLogoutEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // signing up ...
    on<UserSignUpEvent>((event, emit) {
      emit(AuthSigningUp());
      apiDataProvider
          .signUp(
              username: event.username,
              email: event.email,
              password: event.password,
              name: event.name,
              phoneNumber: event.phoneNumber,
              role: event.role)
          .then((user) {
        emit(AuthSignupSuccess(user: user));
      }).catchError((error) {
        emit(AuthSignupError(error: error.toString()));
      });
    });

    // signup Success
    on<UserSignUpSuccessEvent>((event, emit) {
      emit(AuthSignupSuccess(user: event.user as User));
    });

    // signup Error
    on<UserSignUpErrorEvent>((event, emit) {
      emit(AuthSignupError(error: event.error));
    });

    // delete account ...
    on<UserDeleteAccountEvent>((event, emit) {
      emit(AuthDeletingAccount());
    });

    // delete account success
    on<UserDeleteAccountSuccessEvent>((event, emit) {
      emit(AuthDeleteAccountSuccess());
    });

    // delete account error
    on<UserDeleteAccountErrorEvent>((event, emit) {
      emit(AuthDeleteAccountError(error: event.error));
    });
  }
}
