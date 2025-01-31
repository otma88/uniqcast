import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/presentation/widgets/program_item.dart';

class ProgramByDayListWidget extends StatelessWidget {
  final List<Program> programList;

  const ProgramByDayListWidget(this.programList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ProgramItem(programList[index]);
      },
      separatorBuilder: (context, index) => Gap(AppSizes.spacingM),
      itemCount: programList.length,
    );
  }
}
