import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/application/auth/auth.dart';

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
            bloc.add(AuthLoginEvent(email: testEmail, password: testPassword, role: 'trainer')),
        expect: () => [AuthLoggingIn()],
      );
    });

    group('AuthLoginSuccessEvent', () {
      blocTest(
        'emits [success]',
        build: () => AuthBloc(),
        act: (bloc) => bloc.add(AuthLoginEvent(role: testRole, email: '', password: '')),
        expect: () => [AuthLoginSuccess(role: testRole)],
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

  });
}
