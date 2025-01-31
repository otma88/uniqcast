import 'package:flutter/material.dart';
import 'package:uniqcast/theme/app_colors.dart';

abstract class AppFontStyles {
  static const baseTitleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final baseDescriptionStyle = TextStyle(
    fontSize: 12,
    color: AppColors.descriptionTextColor,
  );
}
