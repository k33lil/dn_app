import 'package:flutter/material.dart';

class AuthCustomPaint extends CustomPainter {
  AuthCustomPaint({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) async {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height )
      ..lineTo(size.width * .8, size.height)
      ..lineTo(size.width, size.height * .8)
      ..lineTo(size.width, 0)
      ..close();

    final paint = Paint()..color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AuthCustomPaint oldDelegate) {
    return false;
  }
}
