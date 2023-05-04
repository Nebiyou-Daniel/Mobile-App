import 'package:flutter/material.dart';
import 'package:frontend/header_banner.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeaderBanner(),
      ),
      body: const Text("This is the body"),
    );
  }
}
