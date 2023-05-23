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
    // This is the timer for the splash screen
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
                secondary: const Color.fromRGBO(255, 215, 0, 1))),
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
                        // a stylish font that looks like a warrior will use it
                        fontFamily: 'Bangers',
                        color: Color.fromRGBO(214, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // beautiful slogan text that says "Unleash your inner warrior with workout warriot"
                  const Text(
                    "Unleash your inner warrior with Workout Warriors",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 215, 0, 1),
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Container(height: 50),
                  Expanded(
                    child: ClipRect(
                      // make borders rounded
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: Colors.black,
                        child: Image.asset(
                          'assets/images/bear_nobg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  Container(height: 50),

                  const CircularProgressIndicator(
                    color: Colors.red,
                  ),
                  Container(height: 50)
                ],
              ),
            )));
  }
}
