import 'package:flutter/material.dart';

class SentMessageShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0xffAE6611);
    path = Path();
    path.lineTo(size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.05, 0, 15, 0);
    path.cubicTo(20, 0, 0, 0, 0, 20);

    path.cubicTo(20, 0, 0, 20, 0, 20);

    path.cubicTo(0, size.height, 0, size.height, 20, size.height);
///////////////////////////////////////////////////////////////////////////////////////
    path.cubicTo(size.width * 0.05, size.height, size.width * 0.92, size.height,
        size.width * 0.92, size.height);
    path.cubicTo(size.width * 0.94, size.height, size.width * 0.96,
        size.height * 0.94, size.width * 0.97, size.height * 0.86);
    path.cubicTo(
        size.width * 0.97, size.height * 0.86, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, 0, size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
