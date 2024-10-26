import 'package:flutter/material.dart';
import 'package:viewith/resource/constant.dart';
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
        ..color = section.id.contains(Strings.textSuffix) ? Colors.white : Colors.black.withOpacity(0.5)
        ..style = PaintingStyle.fill;

      canvas.drawPath(section.path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StagePainter oldDelegate) {
    return true;
  }
}
