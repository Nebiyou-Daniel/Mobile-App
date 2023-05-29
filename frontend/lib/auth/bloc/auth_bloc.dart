import 'dart:async';

import 'package:frontend/auth/bloc/auth_event.dart';
import 'package:frontend/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_provider/api_data_providor.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    on<UserLoginEvent>((event, emit) async {
      // ...loggin in ...
      emit(AuthLoggingIn());
      // ... try logging in
      try {
        // wait 1 second
        await Future.delayed(const Duration(seconds: 1));
        // send a mock data
        emit(AuthLoginSuccess(role: "trainer"));

        // await apiDataProvider.login(email: event.email, password: event.password);
      } catch (error) {
        emit(AuthLoginError(error: error.toString()));
      }
    });

    // login success
    on<UserLoginSuccessEvent>((event, emit) {
      emit(AuthLoginSuccess(role: event.role));
    });

    // login Error
    on<UserLoginErrorEvent>((event, emit) {
      emit(AuthLoginError(error: event.error));
    });

    // logging out ...
    on<UserLogoutEvent>((event, emit) {
      emit(AuthLoggingOut());
      // get the id of the currently loggedin user from the shared preferences
      // String? userId = await sharedPrefDataProvider.getUserId();
      // if (userId != null) {
      // send a request to the server to logout the user
      // await apiDataProvider.logout(userId: userId);
      // emit(AuthLogoutSuccess());
      // } else {
      // emit(AuthLogoutError());
      // }
    });

    // logout Error
    on<UserLogoutErrorEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // logout success
    on<UserLogoutSuccessEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // signing up ...
    on<UserSignUpEvent>((event, emit) async {
      emit(AuthSigningUp());
      try {
        await Future.delayed(const Duration(seconds: 1));
        // send a mock data for test purpose only
        emit(AuthSignupSuccess(role: "trainer"));
        // await apiDataProvider.signUp(
        //     name: event.name,
        //     username: event.username,
        //     email: event.email,
        //     phoneNumber: event.phoneNumber,
        //     password: event.password,
        //     role: event.role);
      } catch (error) {
        emit(AuthSignupError(error: error.toString()));
      }
    });

    // signup Success
    on<UserSignUpSuccessEvent>((event, emit) {
      emit(AuthSignupSuccess(role: event.role));
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
