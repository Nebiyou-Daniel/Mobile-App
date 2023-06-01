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
      try {} catch (error) {
        emit(AuthLoginError(error: error.toString()));
        // delete access token from shared pregerence and emit a logout success state..
      }
    });

    // logging out ...
    on<AuthLogoutEvent>((event, emit) {
      emit(AuthLoggingOut());
    });

    // signing up ...
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthSigningUp());

      try {
        String access_token;
        if (event.role == "trainee")
          access_token = await apiDataProvider.traineeSignUp(
              name: event.name,
              email: event.email,
              password: event.password,
              role: event.role);
        else if (event.role == "trainer") {
          access_token = await apiDataProvider.trainerSignUp(
              name: event.name,
              email: event.email,
              password: event.password,
              role: event.role);
          emit(AuthSignupSuccess(role: "trainer"));
        }
        // await sharedPrefDataProvider.setAccessToken(access_token);
      } catch (error) {
        emit(AuthSignupError(error: error.toString()));
      }
    });

    // delete account ...
    on<AuthDeleteAccountEvent>((event, emit) {
      emit(AuthDeletingAccount());
    });
  }
}
