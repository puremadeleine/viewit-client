import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:viewith/feature/seatmap/widget/painter/path_painter.dart';
import 'package:viewith/feature/seatmap/widget/painter/path_printer.dart';
import 'package:viewith/feature/seatmap/widget/painter/stage_painter.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';

import '../model/seat_section.dart';

class SeatMap extends StatefulWidget {
  final String seatmapName;
  final String? stageName;
  final Function(String) onSectionSelected;

  const SeatMap(
      {super.key,
      required this.seatmapName,
      this.stageName,
      required this.onSectionSelected});

  @override
  State<SeatMap> createState() => _SeatMapState();
}

class _SeatMapState extends State<SeatMap> {
  List<Section> sections = [];
  List<Section> stages = [];
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSeatMap();
    _loadStages();
    print('test ${stages.length}');
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  Future<XmlDocument> _loadSvg(String name) async {
    final String svgString =
        await DefaultAssetBundle.of(context).loadString(name);
    final document = xml.XmlDocument.parse(svgString);

    final svgElement = document.findAllElements('svg').first;
    _svgWidth =
        double.tryParse(svgElement.getAttribute('width') ?? '') ?? 100.0;
    _svgHeight =
        double.tryParse(svgElement.getAttribute('height') ?? '') ?? 100.0;

    return document;
  }

  Future<void> _loadSeatMap() async {
    final document = await _loadSvg(widget.seatmapName);

    setState(() {
      sections = [
        ...document.findAllElements('rect').map((element) {
          final id = element.getAttribute('id') ?? '';
          _setColor(id);
          return Section(id, _getRectPath(element));
        }),
        ...document.findAllElements('path').map((element) {
          final path = element.getAttribute('d') ?? '';
          final id = element.getAttribute('id') ?? '';
          _setColor(id);
          return Section(id, _getPath(path));
        }),
      ];
    });
  }

  Future<void> _loadStages() async {
    final stageName = widget.stageName;
    if (stageName == null) return;
    final document = await _loadSvg(stageName);

    setState(() {
      stages = document.findAllElements('path').map((element) {
        final path = element.getAttribute('d') ?? '';
        final id = element.getAttribute('id') ?? '';
        return Section(id, _getPath(path));
      }).toList();
    });
  }

  Path _getPath(String svgPath) {
    final Path path = Path();
    writeSvgPathDataToPath(svgPath, PathPrinter(path));
    return path;
  }

  Path _getRectPath(xml.XmlElement element) {
    final x = double.tryParse(element.getAttribute('x') ?? '') ?? 0.0;
    final y = double.tryParse(element.getAttribute('y') ?? '') ?? 0.0;
    final width = double.tryParse(element.getAttribute('width') ?? '') ?? 0.0;
    final height = double.tryParse(element.getAttribute('height') ?? '') ?? 0.0;
    final rx = double.tryParse(element.getAttribute('rx') ?? '') ?? 0.0;

    final path = Path();
    if (rx > 0) {
      // Rounded rectangle
      path.addRRect(
          RRect.fromRectXY(Rect.fromLTWH(x, y, width, height), rx, rx));
    } else {
      // Regular rectangle
      path.addRect(Rect.fromLTWH(x, y, width, height));
    }

    return path;
  }

  void _setColor(String id) {
    colors[id] = id.contains('TEXT') ? defaultTextColor : defaultColor;
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
          key: const ValueKey('seatMapGestureDetector'),
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
            child: Stack(
              children: [
                CustomPaint(
                  key: const ValueKey('seatMapCustomPaint'),
                  painter: PathPainter(
                    sections: sections,
                    colors: colors,
                    defaultColor: defaultColor,
                    scale: scale,
                  ),
                  size: Size(parentWidth, parentHeight),
                ),
                // CustomPaint(
                //   painter: PathPainter(
                //     sections: stages,
                //     colors: colors,
                //     defaultColor: defaultColor,
                //     scale: scale,
                //   ),
                //   size: Size(parentWidth, parentHeight),
                // ),
                CustomPaint(
                  painter: StagePainter(
                    sections: stages,
                    defaultColor: defaultColor,
                    scale: scale,
                  ),
                )
              ],
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
      colors['$id TEXT'] = (colors['$id TEXT'] == selectedTextColor)
          ? defaultTextColor
          : selectedTextColor;
    });
  }
}
