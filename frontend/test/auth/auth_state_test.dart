import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/application/auth/auth.dart';

void main() {
  group('AuthState', () {
    group('AuthInitial', () {
      test('check to see initialization', () {
        expect(AuthInitial().props, equals([]));
      });
    });
    group('AuthLoggingIn', () {
      test('check if logging in works', () {
        expect(AuthLoggingIn().props, equals(<Object?>[]));
      });
    });
        group('AuthLogginOut', () {
      test('check to see if currently logging out', () {
        expect(AuthLoggingOut().props, equals([]));
      });
    });
        group('AuthLogoutSuccess', () {
      test('check to see if logging out works', () {
        expect(AuthLogoutSuccess().props, equals([]));
      });
    });
        group('AuthLogoutError', () {
      test('check to see if logout does not work', () {
        expect(AuthLogoutError(error: "error msg").props, equals([]));
      });
    });
        group('AuthLoginError', () {
      test('check to see if login does not work', () {
        expect(AuthLoginError(error: 'error msg').props, equals([]));
      });
          group('AuthSigningUp', () {
      test('check to see if currently signing up', () {
        expect(AuthSigningUp().props, equals([]));
      });
    });
        group('AuthSignupSuccess', () {
      test('check to see if signup works', () {
        expect(AuthSignupSuccess(role: 'trainee').props, equals([]));
      });
    });
        group('AuthSignupError', () {
      test('check to see if signup does not work', () {
        expect(AuthSignupError(error: 'error msg').props, equals([]));
      });
    });
        group('AuthDeletingAccount', () {
      test('check to see if currently deleting account', () {
        expect(AuthDeletingAccount().props, equals([]));
      });
    });    group('AuthDeleteAccountSuccess', () {
      test('check to see if account deletes', () {
        expect(AuthDeleteAccountSuccess().props, equals([]));
      });
    });
        group('AuthDeleteAccountError', () {
      test('check to see if account does not delete', () {
        expect(AuthDeleteAccountError(error: 'error msg').props, equals([]));
      });
    });
    });
  });

  
}
