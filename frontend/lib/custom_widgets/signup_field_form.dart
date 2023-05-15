import 'package:flutter/material.dart';
import 'package:frontend/Custom_Widgets/role_dropdown_selection.dart';

import 'Gap.dart';
import 'password_form_field.dart';

class SignUpFieldForm extends StatelessWidget {
  const SignUpFieldForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                label: Text("Email"),
                hintText: 'Enter your email',
              ),
            ),
            const Gap(height: 20.0),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person_rounded),
                label: Text("Full Name"),
                hintText: "Enter your full name",
              ),
            ),
            const Gap(height: 20.0),
            PasswordFormField(
              controller: TextEditingController(),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            const Gap(height: 20.0),
            PasswordFormField(
              controller: TextEditingController(),
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
            ),
            const Gap(height: 20.0),
            const RoleSelection(),
            const Gap(height: 50.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // validation for email,
                  },
                  child: const Text('Create Account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
