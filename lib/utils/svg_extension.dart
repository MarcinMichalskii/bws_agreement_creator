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
    // same thing

    // Convert to ui.Image. toImage() takes width and height as parameters
    // you need to find the best size to suit your needs and take into account the screen DPI
    final image = await svgDrawableRoot.picture.toImage(
        int.parse(widthAttribute.toString()),
        int.parse(heightAttribute.toString()));
    ByteData? bytes = await image.toByteData(format: ImageByteFormat.png);

    return bytes?.buffer.asUint8List();
  }
}
