import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/core/domain/router/pages.dart';
import 'package:uniqcast/core/domain/utils/extensions/date_time_extensions.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/theme/app_colors.dart';
import 'package:uniqcast/theme/font_styles.dart';

class ProgramDetailsPage extends StatelessWidget {
  static const routeName = Pages.programDetailsPage;
  final Program programDetails;

  const ProgramDetailsPage(this.programDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'PROGRAM DETAILS',
          style: AppFontStyles.baseTitleStyle.copyWith(fontSize: 25),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://images.pexels.com/photos/1108099/pexels-photo-1108099.jpeg',
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.spacingXL),
              child: Column(
                children: [
                  Text(
                    programDetails.title,
                    style: AppFontStyles.baseTitleStyle.copyWith(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  Gap(AppSizes.spacingL),
                  Text(
                    '${programDetails.startTime.formattedHHmm}  -  ${programDetails.stopTime.formattedHHmm}',
                    style: AppFontStyles.baseDescriptionStyle
                        .copyWith(fontSize: 15),
                  ),
                  Gap(AppSizes.spacingL),
                  Text(
                    programDetails.description,
                    style: AppFontStyles.baseDescriptionStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
