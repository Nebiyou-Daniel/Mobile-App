import 'package:flutter/material.dart';
import 'package:frontend/Custom_Widgets/role_dropdown_selection.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 20),
              child: Row(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 21),
                    child: Icon(Icons.info),
                  ),
                  Text("Fill the following information to sign up."),
                ],
              ),
            ),

            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                label: Text("Email"),
                hintText: 'Enter your email',
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 20.0)),

            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person_rounded),
                label: Text("Full Name"),
                hintText: "Enter your full name",
              ),
            ),

            Container(margin: const EdgeInsets.only(top: 20.0)),

            PasswordFormField(
              controller: TextEditingController(),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),

            Container(margin: const EdgeInsets.only(top: 20.0)),

            PasswordFormField(
              controller: TextEditingController(),
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
            ),

            Container(margin: const EdgeInsets.only(top: 40.0)),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 20),
              child: Row(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 21),
                    child: Icon(Icons.info),
                  ),
                  Text("Select your role"),
                ],
              ),
            ),

            // Role selection dropdown here
            const RoleSelection(),

            Container(margin: const EdgeInsets.only(top: 20.0)),
            SizedBox(
              width: 300,
              height: 38,
              child: ElevatedButton(
                onPressed: () {
                  // validation for email,
                },
                child: const Text('Create Account'),
              ),
            ),

            Container(margin: const EdgeInsets.only(top: 20.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    print("Login button clicked");
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
