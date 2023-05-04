import 'package:flutter/material.dart';

class SignUpFieldForm extends StatelessWidget {
  const SignUpFieldForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                label: Icon(Icons.email),
                hintText: 'Enter your email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Icon(Icons.person_rounded),
                hintText: 'Username',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // validation for email,
                },
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
