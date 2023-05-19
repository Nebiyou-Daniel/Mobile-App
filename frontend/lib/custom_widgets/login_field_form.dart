import 'package:flutter/material.dart';
import 'Gap.dart';
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
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 21),
                      child: Icon(Icons.info),
                    ),
                    Text("Enter your username and password."),
                  ],
                )),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // validation for email,
                  },
                  child: const Text('LOGIN'),
                ),
              ),
            ),
            const Gap(height: 40.0),
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
