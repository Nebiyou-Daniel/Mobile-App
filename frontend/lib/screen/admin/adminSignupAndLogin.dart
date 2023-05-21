import 'package:flutter/material.dart';
import 'package:frontend/custom_widgets/header_banner.dart';

import '../../custom_widgets/password_form_field.dart';

class AdminSignupAndLogin extends StatefulWidget {
  const AdminSignupAndLogin({super.key});

  @override
  State<AdminSignupAndLogin> createState() => AdminSignupAndLoginState();
}

class AdminSignupAndLoginState extends State<AdminSignupAndLogin> {
  int triesLeft = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderBanner(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                child: Text(
                  "Admin Signup/Login Page",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Text(
                  "This is where admin is redirected after trying to connect to their account (either signing up or logging in).",
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Enter the secret code number given to you by the workout warriors company.",
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 39.5),
                child: PasswordFormField(
              controller: TextEditingController(),
              labelText: 'Secret Code',
              hintText: '',
            ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 15.0),
                child: Text(
                  "You have $triesLeft tries left",
                  softWrap: true,
                ),
              ),
              ElevatedButton(
                onPressed: () {

                  print("your data is submitted");


                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
