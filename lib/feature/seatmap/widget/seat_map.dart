import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:xml/xml.dart' as xml;

import '../model/seat_section.dart';

class SeatMap extends StatefulWidget {
  final String assetName;
  final Function(String) onSectionSelected;

  const SeatMap({super.key, required this.assetName, required this.onSectionSelected});

  @override
  State<SeatMap> createState() => _SeatMapState();
}

class _SeatMapState extends State<SeatMap> {
  List<SeatSection> sections = [];
  Map<String, Color> colors = {};
  double _svgWidth = 0;
  double _svgHeight = 0;
  final Color defaultColor = const Color(0xFFD9D9D9);
  final Color selectedColor = Colors.red;

  @override
  void initState() {
    super.initState();

    _loadPathsFromSVG();
  }

  Future<void> _loadPathsFromSVG() async {
    final String svgString = await DefaultAssetBundle.of(context).loadString(widget.assetName);
    final document = xml.XmlDocument.parse(svgString);

    final svgElement = document.findAllElements('svg').first;
    _svgWidth = double.tryParse(svgElement.getAttribute('width') ?? '') ?? 100.0;
    _svgHeight = double.tryParse(svgElement.getAttribute('height') ?? '') ?? 100.0;

    setState(() {
      sections = document.findAllElements('path').map((element) {
        final pathData = element.getAttribute('d') ?? '';
        final id = element.getAttribute('id') ?? '';
        return SeatSection(id, parseSVGPath(pathData));
      }).toList();
    });
  }

  Path parseSVGPath(String svgPath) {
    final Path path = Path();
    writeSvgPathDataToPath(svgPath, PathPrinter(path));
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final parentWidth = constraints.maxWidth;
      final parentHeight = constraints.maxHeight;

      final scaleX = parentWidth / _svgWidth;
      final scaleY = parentHeight / _svgHeight;
      final scale = (scaleX < scaleY) ? scaleX : scaleY;

      return GestureDetector(
        onTapDown: (details) {
          final localPosition = details.localPosition;
          final scaledPosition = Offset(
            localPosition.dx / scale,
            localPosition.dy / scale,
          );
          _onSectionTap(scaledPosition);
        },
        child: CustomPaint(
          painter: PathPainter(
            sections: sections,
            colors: colors,
            defaultColor: defaultColor,
            scale: scale,
          ),
          isComplex: true,
          willChange: true,
          child: SizedBox(
            width: parentWidth,
            height: parentHeight,
          ),
        ),
      );
    });
  }

  void _onSectionTap(Offset position) {
    for (var section in sections) {
      if (section.path.contains(position)) {
        _changeColor(section.id);
        widget.onSectionSelected(section.id);
        break;
      }
    }
  }

  void _changeColor(String id) {
    setState(() {
      colors[id] = (colors[id] == selectedColor) ? defaultColor : selectedColor;
    });
  }
}

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

    for (var section in sections) {
      final paint = Paint()
        ..color = colors[section.id] ?? defaultColor
        ..style = PaintingStyle.fill;

      canvas.drawPath(section.path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) {
    return true;
  }
}

class PathPrinter extends PathProxy {
  final Path path;

  PathPrinter(this.path);

  @override
  void moveTo(double x, double y) {
    path.moveTo(x, y);
  }

  @override
  void lineTo(double x, double y) {
    path.lineTo(x, y);
  }

  @override
  void cubicTo(double x1, double y1, double x2, double y2, double x3, double y3) {
    path.cubicTo(x1, y1, x2, y2, x3, y3);
  }

  @override
  void close() {
    path.close();
  }
}

