import 'package:flutter/material.dart';

class LoadingParagraphWidget extends StatelessWidget {
  final int numberOfLines;
  final String message;

  const LoadingParagraphWidget(
      {Key? key, required this.numberOfLines, this.message = 'Loading...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> lines = List.generate(
      numberOfLines,
      (index) => Container(
        width: 400,
        height: 16.0,
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (Widget line in lines) line,
        const SizedBox(height: 8.0),
        Text(
          message,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
