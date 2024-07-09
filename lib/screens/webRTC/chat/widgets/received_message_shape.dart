import 'package:flutter/material.dart';

class ReceivedMessageShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = const Color(0x91AE6611);
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, 0, size.width * 0.95, 0, size.width * 0.85, 0);
    path.cubicTo(size.width * 0.98, 0, size.width, size.height * 0.05,
        size.width, size.height * 0.11);
    path.cubicTo(size.width, size.height * 0.11, size.width, size.height * 0.89,
        size.width, size.height * 0.89);
    path.cubicTo(size.width, size.height * 0.95, size.width * 0.98, size.height,
        size.width * 0.95, size.height);
    path.cubicTo(size.width * 0.95, size.height, size.width * 0.08, size.height,
        size.width * 0.08, size.height);
    path.cubicTo(size.width * 0.06, size.height, size.width * 0.04,
        size.height * 0.96, size.width * 0.03, size.height * 0.9);

    //path.cubicTo(size.width * 0.03, size.height * 0.9, 0, 0, 0, 0);
    // path.cubicTo(0, 0, 0, 0, 0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
