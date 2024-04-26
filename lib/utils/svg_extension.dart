import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xml/xml.dart' as xml;

extension SvgAsPng on String {
  Future<Uint8List?> asPng() async {
    final svgString = this;
    final document = xml.XmlDocument.parse(svgString);
    final svgElement = document.rootElement;
    final widthAttribute =
        svgElement.getAttribute('width')!.replaceAll("px", "");
    final heightAttribute =
        svgElement.getAttribute('height')!.replaceAll("px", "");

    final svgDrawableRoot =
        await vg.loadPicture(SvgStringLoader(svgString), null);

    final int width = double.parse(widthAttribute).round();
    final int height = double.parse(heightAttribute).round();
    final image = await svgDrawableRoot.picture.toImage(width, height);
    ByteData? bytes = await image.toByteData(format: ImageByteFormat.png);

    return bytes?.buffer.asUint8List();
  }
}
