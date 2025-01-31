import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/core/domain/router/pages.dart';
import 'package:uniqcast/core/domain/utils/extensions/date_time_extensions.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/presentation/widgets/background_program_image.dart';
import 'package:uniqcast/features/program/presentation/widgets/show_more_circle.dart';
import 'package:uniqcast/theme/app_colors.dart';
import 'package:uniqcast/theme/font_styles.dart';

class ProgramItem extends StatelessWidget {
  final Program programItem;

  const ProgramItem(this.programItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        Pages.programDetailsPage,
        arguments: {'program': programItem},
      ),
      child: Stack(
        children: [
          Container(
            height: 90,
            padding: EdgeInsets.only(
              left: AppSizes.spacingXS,
              right: AppSizes.spacingS,
              top: AppSizes.spacingS,
              bottom: AppSizes.spacingS,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(AppSizes.defaultBorderRadius)),
              border: programItem.isCurrent
                  ? Border.all(color: AppColors.currentProgramBorderColor)
                  : null,
            ),
            child: Container(
              padding: EdgeInsets.all(AppSizes.spacingM),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.lightBlueColor, width: 2),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    programItem.startTime.formattedHHmm,
                    style: AppFontStyles.baseTitleStyle,
                  ),
                  Gap(AppSizes.spacingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          programItem.title,
                          style: AppFontStyles.baseTitleStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          programItem.description,
                          style: AppFontStyles.baseDescriptionStyle
                              .copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  Gap(AppSizes.spacingXXL),
                ],
              ),
            ),
          ),
          BackgroundProgramImage(),
          Positioned(
            right: 10,
            top: 30,
            child: ShowMoreCircle(),
          ),
        ],
      ),
    );
  }
}
