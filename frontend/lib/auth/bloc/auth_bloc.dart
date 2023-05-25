import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthLogin>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthSignUp>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthLogout>((event, emit) {
      // TODO: implement event handler
    });
  }
}
