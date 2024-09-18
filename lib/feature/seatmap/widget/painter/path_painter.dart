import 'package:flutter/material.dart';
import '../../model/seat_section.dart';

class PathPainter extends CustomPainter {
  final List<SeatSection> sections;
  final Map<String, Color> colors;
  final Color defaultColor;
  final double scale;

  PathPainter({
    required this.sections,
    required this.colors,
    required this.defaultColor,
    required this.scale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(scale, scale);

    for (final section in sections) {
      final paint = Paint()
        ..color = _getSectionColor(section)
        ..style = PaintingStyle.fill;

      canvas.drawPath(section.path, paint);
    }
  }

  Color _getSectionColor(SeatSection section) {
    if (colors.containsKey(section.id)) {
      return colors[section.id]!;
    }

    if (section.id.contains('text')) {
      return Colors.black;
    }

    return defaultColor;
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) {
    return oldDelegate.colors != colors ||
        oldDelegate.sections != sections ||
        oldDelegate.scale != scale;
  }
}
