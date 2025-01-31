import 'package:flutter/material.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.dotSize,
      width: AppSizes.dotSize,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
