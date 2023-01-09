import 'package:flutter/material.dart';

class CustomColors {
  static const applicationColorMain = Color.fromRGBO(252, 200, 10, 1);
  static const gray = Color.fromRGBO(180, 180, 180, 1);
  static const almostBlack = Color.fromRGBO(55, 55, 55, 1);
  static const almostBlack2 = Color.fromRGBO(33, 33, 33, 1);
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
