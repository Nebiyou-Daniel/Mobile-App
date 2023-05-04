import 'package:flutter/material.dart';
import 'package:frontend/signup.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is a test"),
      ),
    );
  }
}
