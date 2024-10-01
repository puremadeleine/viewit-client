import 'package:flutter/material.dart';
import '../../model/seat_section.dart';

class StagePainter extends CustomPainter {
  final List<Section> sections;
  final Color defaultColor;
  final double scale;

  StagePainter({
    required this.sections,
    required this.defaultColor,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(scale, scale);

    for (final section in sections) {
      final paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill;

      canvas.drawPath(section.path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StagePainter oldDelegate) {
    return true;
  }
}
