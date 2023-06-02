import 'package:frontend/application/auth/bloc/auth_event.dart';
import 'package:frontend/application/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../serviceLocator.dart';
import '../../../infrastructure/auth/data_provider/api_data_providor.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    ApiDataProvider apiDataProvider = ApiDataProvider();
    SharedPreferences preferences = ServiceLocator().preferences;

    // login event ...
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoggingIn());
      try {

        String accessToken;
        accessToken = await apiDataProvider.login(
            email: event.email, password: event.password, role: event.role);

        preferences.setString("access_token", accessToken);
        preferences.setString("role", event.role);
        emit(AuthLoginSuccess(role: event.role));
      } catch (error) {
        emit(AuthLoginError(error: error.toString()));
      }
    });

    // signing up ...
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthSigningUp());
      try {
        dynamic accessToken;
        accessToken = await apiDataProvider.signUp(
            name: event.name,
            email: event.email,
            password: event.password,
            role: event.role);
        await preferences.setString("access_token", accessToken);
        await preferences.setString("role", event.role);
        emit(AuthSignupSuccess(role: event.role));
      } catch (error) {
        emit(AuthSignupError(error: error.toString()));
      }
    });

    // logout event ...
    on<AuthLogoutEvent>((event, emit) async {
      try {
        _print(preferences);
        await preferences.remove("access_token");
        await preferences.remove("role");
        emit(AuthLogoutSuccess());
      } catch (error) {
        emit(AuthLogoutError(
            error: "An error occurred while logging out. Please try again."));
      }
    });

    // delete account ...
    on<AuthDeleteSelfAccountEvent>((event, emit) {
      // get access token
      String accessToken = preferences.getString("access_token")!;
      String role = preferences.getString("role")!;
      emit(AuthDeletingAccount());
      try {
        bool accountDeleted = apiDataProvider.deleteSelfAccount(
            accessToken: accessToken, role: role);
        if (accountDeleted) {
          emit(AuthDeleteAccountSuccess());
        } else {
          emit(AuthDeleteAccountError(
              error:
                  "An error occurred while deleting your account. Please try again."));
        }
      } catch (error) {
        emit(AuthDeleteAccountError(
            error:
                "An error occurred while deleting your account. Please try again."));
      }
    });

    on<AuthDeleteAccountByIdEvent>((event, emit) {
      // get access token
      String accessToken = preferences.getString("access_token")!;
      emit(AuthDeletingAccount());
      try {
        // try deleting the account of the person with the given id
        bool accountDeleted = apiDataProvider.deleteAccountById(
            accessToken: accessToken, role: event.role, id: event.id);
        if (accountDeleted) {
          emit(AuthDeleteAccountSuccess());
        } else {
          emit(AuthDeleteAccountError(
              error:
                  "An error occurred while deleting your account. Please try again."));
        }
      } catch (error) {
        emit(AuthDeleteAccountError(
            error: "An error occurred while deleting your account. Please try again."));
      }
    });
  }

  _print(preferences) {
    preferences.getKeys().forEach((key) {
      print('$key: ${preferences.get(key)}');
    });
  }
}
