
import 'package:flutter/material.dart';

Widget buildDottedDivider() {
  return SizedBox(
    width: double.infinity,
    height: 1,
    child: CustomPaint(
      painter: DottedLinePainter(),
    ),
  );
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white // Change the color if needed
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 4.0;
    const double dashSpace = 4.0;
    double currentX = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0.0),
        Offset(currentX + dashWidth, 0.0),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}