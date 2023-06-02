import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/auth/auth.dart';

void main() {
  group('Auth Bloc', () {
    AuthBloc buildBloc() {
      return AuthBloc();
    }

    String testName = 'John Doe';
    String testEmail = 'sth@gmail.com';
    String testPassword = '12345';
    String testRole = 'trainee';
    String error = 'error msg';

    group('constructor', () {
      test('check if it works', () {
        expect(buildBloc, returnsNormally);
      });

      test('checking if initializing works', () {
        expect(buildBloc().state, equals(AuthInitial()));
      });
    });

    group('AuthLoginEvent', () {
      blocTest(
        'emits [success] when is logged in successfully',
        build: () => AuthBloc(),
        act: (bloc) =>
            bloc.add(AuthLoginEvent(email: testEmail, password: testPassword)),
        expect: () => [AuthLoggingIn()],
      );
    });

    group('AuthLoginSuccessEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthLoginSuccessEvent(role: testRole)),
        expect: () => [AuthLoginSuccess(role: testRole)],
      );
    });
    group('AuthLoginErrorEvent', () {
      blocTest(
        'emits [error] if login fails',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthLoginErrorEvent(error: error)),
        expect: () => [AuthLoginError(error: error)],
      );
    });
    group('AuthLogoutEvent', () {
      blocTest(
        'emits [success] if currently logging out',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthLogoutEvent()),
        expect: () => [AuthLoggingOut()],
      );
    });
    group('AuthLogoutErrorEvent', () {
      blocTest(
        'emits [error] if logout fails',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthLogoutErrorEvent(error: error)),
        expect: () => [AuthLoggingOut()],
      );
    });
    group('AuthLogoutSuccessEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthLogoutSuccessEvent()),
        expect: () => [AuthLoggingOut()],
      );
    });
    group('AuthSignupEvent', () {
      blocTest(
        'emits [success] when signup event is called',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthSignUpEvent(
            email: testEmail,
            name: testName,
            password: testPassword,
            role: testRole)),
        expect: () => [AuthSigningUp()],
      );
    });
    group('AuthSignupSuccessEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthSignUpSuccessEvent(role: testRole)),
        expect: () => [AuthSignupSuccess(role: testRole)],
      );
    });  
    group('AuthSignupErrorEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthSignUpErrorEvent(error: error)),
        expect: () => [AuthSignupError(error: error)],
      );
    });
    group('AuthDeleteAccountEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthDeleteAccountEvent()),
        expect: () => [AuthDeletingAccount()],
      );
    });   
    group('AuthDeleteAccountSuccessEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthDeleteAccountSuccessEvent()),
        expect: () => [AuthDeleteAccountSuccess()],
      );
    });
    group('AuthDeleteAccountErrorEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthDeleteAccountErrorEvent(error: error)),
        expect: () => [AuthDeleteAccountError(error: error)],
      );
    });
  });
}
