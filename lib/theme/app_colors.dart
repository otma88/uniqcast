import 'package:flutter/material.dart';

class AppColors {
  static final Color testColor = HexColor.fromHex('#000000');
  static final Color primaryColor = Color(0xff23282d);

  static final Color secondaryColor = Color(0xff2d323c);

  static final Color descriptionTextColor = Color(0xffb0b1b4);

  static final Color lightBlueColor = Color(0xff4fb7ca);

  static final Color currentProgramBorderColor = Color(0xffd7d7d9);
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
