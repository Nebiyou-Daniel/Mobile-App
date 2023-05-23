import 'package:flutter/material.dart';
import 'package:frontend/Custom_Widgets/header_banner.dart';
import 'package:frontend/Custom_Widgets/signup_field_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                child: const SignUpFieldForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
