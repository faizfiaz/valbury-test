import 'package:valburytest/constants/colors.dart';
import 'package:flutter/material.dart';

class StrokePrice extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 20);
    final p2 = Offset(80, 0);
    final paint = Paint()
      ..color = primaryText
      ..strokeWidth = 1;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}