import 'package:flutter/material.dart';

class LoadingParagraphWidget extends StatelessWidget {
  final int numberOfLines;

  const LoadingParagraphWidget({super.key, required this.numberOfLines});

  @override
  Widget build(BuildContext context) {
    final List<Widget> lines = List.generate(
      numberOfLines,
      (index) => Container(
        width: 200.0,
        height: 8.0,
        margin: const EdgeInsets.only(top: 4.0),
        color: Colors.grey,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (Widget line in lines) line,
        const SizedBox(height: 4.0),
        const Text(
          'Loading...',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
