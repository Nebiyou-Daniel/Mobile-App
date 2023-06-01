import 'dart:async';

import 'package:frontend/auth/bloc/auth_event.dart';
import 'package:frontend/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data_provider/api_data_providor.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();

    on<AuthLoginEvent>((event, emit) async {
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
    on<AuthLoginSuccessEvent>((event, emit) {
      emit(AuthLoginSuccess(role: event.role));
    });

    // login Error
    on<AuthLoginErrorEvent>((event, emit) {
      emit(AuthLoginError(error: event.error));
    });

    // logging out ...
    on<AuthLogoutEvent>((event, emit) {
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
    on<AuthLogoutErrorEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // logout success
    on<AuthLogoutSuccessEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // signing up ...
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthSigningUp());
      try {
        await apiDataProvider.traineeSignUp(
            name: event.name,
            email: event.email,
            password: event.password,
            role: event.role);
        emit(AuthSignupSuccess(role: "trainer"));
      } catch (error) {
        emit(AuthSignupError(error: error.toString()));
      }
    });

    // signup Success
    on<AuthSignUpSuccessEvent>((event, emit) {
      emit(AuthSignupSuccess(role: event.role));
    });

    // signup Error
    on<AuthSignUpErrorEvent>((event, emit) {
      emit(AuthSignupError(error: event.error));
    });

    // delete account ...
    on<AuthDeleteAccountEvent>((event, emit) {
      emit(AuthDeletingAccount());
    });

    // delete account success
    on<AuthDeleteAccountSuccessEvent>((event, emit) {
      emit(AuthDeleteAccountSuccess());
    });

    // delete account error
    on<AuthDeleteAccountErrorEvent>((event, emit) {
      emit(AuthDeleteAccountError(error: event.error));
    });
  }
}
