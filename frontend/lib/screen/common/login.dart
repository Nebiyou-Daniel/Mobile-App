
import 'package:flutter/material.dart';
import '../../custom_widgets/header_banner.dart';
import '../../custom_widgets/login_field_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const HeaderBanner(),
              Container(
                padding: const EdgeInsets.all(39.5),
                child: const LoginFieldForm(),
              ),
              // Below is the signup form.
            ],
          ),
        ),
      ),
    );
  }
}
