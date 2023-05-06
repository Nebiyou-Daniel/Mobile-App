import 'package:flutter/material.dart';
import 'package:frontend/about.dart';
import 'package:frontend/adminSignupAndLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSignupandLogin();
  }
}
