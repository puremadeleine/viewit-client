import 'package:flutter/widgets.dart';
import 'package:viewith/resource/constant.dart';
import 'package:xml/xml.dart';

class SvgUtil {
  static Future<Size> getSize(BuildContext context, String name) async {
    final String svgString = await DefaultAssetBundle.of(context).loadString(name);
    final document = XmlDocument.parse(svgString);

    final svgElement = document.findAllElements(Strings.svg).first;
    final svgWidth = double.tryParse(svgElement.getAttribute(Strings.width) ?? '') ?? 100.0;
    final svgHeight = double.tryParse(svgElement.getAttribute(Strings.height) ?? '') ?? 100.0;

    return Size(svgWidth, svgHeight);
  }
}