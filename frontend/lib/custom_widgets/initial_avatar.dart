import 'package:flutter/material.dart';

class InitialsAvatar extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final Color textColor;
  final double size;

  const InitialsAvatar({
    super.key,
    required this.initials,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _AvatarPainter(initials, backgroundColor, textColor),
      ),
    );
  }
}

class _AvatarPainter extends CustomPainter {
  final String initials;
  final Color backgroundColor;
  final Color textColor;

  _AvatarPainter(this.initials, this.backgroundColor, this.textColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = backgroundColor;
    final radius = size.width / 2;

    canvas.drawCircle(Offset(radius, radius), radius, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: initials,
        style: TextStyle(
          color: textColor,
          fontSize: radius * 0.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    final dx = (size.width - textWidth) / 2;
    final dy = (size.height - textHeight) / 2;

    textPainter.paint(canvas, Offset(dx, dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
