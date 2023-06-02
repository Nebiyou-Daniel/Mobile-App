import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/main.dart' as app;

void main() {
  group('App test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Full App test", (tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 2));

      final signUpSubmitButton = find.text('Sign Up');
      expect(signUpSubmitButton, findsOneWidget);
      await tester.tap(signUpSubmitButton);
      await tester.pumpAndSettle();

      final fullNameField = find.byKey(const Key('full_name_field'));
      final emailField = find.byKey(const Key('email_field'));
      final passwordField = find.byKey(const Key('password_field'));
      final confirmPasswordField =
          find.byKey(const Key('confirm_password_field'));

      await tester.enterText(fullNameField, 'John Doe');
      await tester.enterText(emailField, 'johndoe@example.com');
      await tester.enterText(passwordField, 'password');
      await tester.enterText(confirmPasswordField, 'password');

      final preferenceDropdown = find.byKey(const Key('preference_dropdown'));
      expect(preferenceDropdown, findsOneWidget);
      await tester.tap(preferenceDropdown);
      await tester.pumpAndSettle();
    });
  });
}
