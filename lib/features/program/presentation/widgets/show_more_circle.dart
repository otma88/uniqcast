import 'package:flutter/material.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/features/program/presentation/widgets/dot_widget.dart';
import 'package:uniqcast/theme/app_colors.dart';

class ShowMoreCircle extends StatelessWidget {
  const ShowMoreCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      height: AppSizes.showMoreCircleSize,
      width: AppSizes.showMoreCircleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotWidget(),
          DotWidget(),
          DotWidget(),
        ],
      ),
    );
  }
}
