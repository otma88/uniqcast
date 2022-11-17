import 'package:flutter/material.dart';

class AppColors {
  static final Color testColor = HexColor.fromHex('#000000');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    var tmpHexColorString = hexColorString.replaceAll('#', '');
    if (tmpHexColorString.length == 6) {
      tmpHexColorString = '0xFF$tmpHexColorString';
    } else {
      tmpHexColorString = '0x$tmpHexColorString';
    }
    return Color(int.parse(tmpHexColorString));
  }
}
