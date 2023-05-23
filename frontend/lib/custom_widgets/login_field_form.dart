import 'package:flutter/material.dart';
import 'password_form_field.dart';

class LoginFieldForm extends StatelessWidget {
  const LoginFieldForm({super.key});

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
              keyboardType: TextInputType.emailAddress,
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
            SizedBox(
              width: 300,
              height: 38,
              child: ElevatedButton(
                onPressed: () {
                  // validation for email,
                },
                child: const Text('LOGIN'),
              ),
            ),
            Container(margin: const EdgeInsets.only(top: 40.0)),
            // Ask if don't have an account and when clicked  redirect to the signup page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    print("Sign Up button clicked");
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
