import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => GoRouter.of(context).go('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.black12,
                secondary: Color.fromARGB(255, 176, 155, 37))),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // the name of the app in a text widget with beatiful font
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Workout Warriors",
                      style: TextStyle(
                        fontSize: 45,
                        color: Color.fromRGBO(214, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "Unleash your inner warrior with Workout Warriors",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(245, 102, 0, 1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Container(height: 50),
                  const Expanded(
                    child: CircleAvatar(
                      radius: 200,
                      backgroundColor: Colors.transparent,
                      //make the background photo centered
                      child: Image(
                        image: AssetImage('assets/images/bear_nobg.png'),
                        fit: BoxFit.cover,
                        width: 280,
                      ),
                      
                    ),
                  ),

                  Container(height: 50),

                  // loading circle for ios
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ),
                  Container(height: 50)
                ],
              ),
            )));
  }
}
