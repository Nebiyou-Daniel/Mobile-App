import 'package:flutter/material.dart';

class AdminSignupandLogin extends StatefulWidget {
  const AdminSignupandLogin({super.key});

  @override
  State<AdminSignupandLogin> createState() => AdminSignupandLoginState();
}

class AdminSignupandLoginState extends State<AdminSignupandLogin> {
  int triesLeft = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Admin Signup/Login Page"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                    vertical: 10.0, horizontal: 25.0),
                child: TextField(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: Text(
                  "You have $triesLeft tries left",
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
