import 'package:flutter/material.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:viewith/feature/seatmap/widget/painter/path_painter.dart';
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
  final Color selectedColor = Colors.black;
  final Color defaultTextColor = Colors.black;
  final Color selectedTextColor = Colors.white;

  final TransformationController _transformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    _loadPathsFromSVG();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<void> _loadPathsFromSVG() async {
    final String svgString =
        await DefaultAssetBundle.of(context).loadString(widget.assetName);
    final document = xml.XmlDocument.parse(svgString);

    final svgElement = document.findAllElements('svg').first;
    _svgWidth =
        double.tryParse(svgElement.getAttribute('width') ?? '') ?? 100.0;
    _svgHeight =
        double.tryParse(svgElement.getAttribute('height') ?? '') ?? 100.0;

    setState(() {
      sections = document.findAllElements('path').map((element) {
        final path = element.getAttribute('d') ?? '';
        final id = element.getAttribute('id') ?? '';
        return SeatSection(id, _getPath(path));
      }).toList();
    });
  }

  Path _getPath(String svgPath) {
    final Path path = Path();
    writeSvgPathDataToPath(svgPath, PathPrinter(path));
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final parentHeight = constraints.maxHeight;

        final scaleX = parentWidth / _svgWidth;
        final scaleY = parentHeight / _svgHeight;
        final scale = (scaleX < scaleY) ? scaleX : scaleY;
        return GestureDetector(
          onTapDown: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final localPosition = box.globalToLocal(details.globalPosition);
            final transformedPosition =
                _transformationController.toScene(localPosition);
            _onSectionTap(transformedPosition, scale);
          },
          child: InteractiveViewer(
            maxScale: 3,
            transformationController: _transformationController,
            child: CustomPaint(
              painter: PathPainter(
                sections: sections,
                colors: colors,
                defaultColor: defaultColor,
                scale: scale,
              ),
              size: Size(parentWidth, parentHeight),
            ),
          ),
        );
      },
    );
  }

  void _onSectionTap(Offset position, double scale) {
    final x = position.dx / scale;
    final y = position.dy / scale;
    final offset = Offset(x, y);

    for (var section in sections) {
      if (section.path.contains(offset)) {
        _changeColor(section.id);
        widget.onSectionSelected(section.id);
        break;
      }
    }
  }

  void _changeColor(String id) {
    setState(() {
      colors[id] = (colors[id] == selectedColor) ? defaultColor : selectedColor;
      colors['$id text'] = (colors['$id text'] == selectedTextColor)
          ? defaultTextColor
          : selectedTextColor;
    });
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