import 'package:flutter/material.dart';
import 'package:frontend/header_banner.dart';
import 'package:frontend/signup_field_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox(
            child: Column(
              children: const <Widget>[
                HeaderBanner(),
                SignUpFieldForm(),
                // Below is the signup form.
              ],
            ),
          ),
        ));
  }
}
