import 'package:flutter/material.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/features/channels/presentation/notifiers/channels_notifier.dart';
import 'package:uniqcast/features/home/presentations/widgets/program_by_day_list_widget.dart';
import 'package:uniqcast/features/program/di.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/utils/program_list_extension.dart';
import 'package:uniqcast/theme/app_colors.dart';
import 'package:uniqcast/theme/font_styles.dart';

class ProgramListWidget extends HookConsumerWidget {
  const ProgramListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programState = ref.watch(programNotifierProvider);
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async => ref
            .read(programNotifierProvider.notifier)
            .getProgram(ref.watch(selectedChannelIdProvider)),
        child: switch (programState) {
          BaseLoading() => CircularProgressIndicator(),
          BaseData<List<Program>>(data: final programList) =>
            programList.isEmpty
                ? Center(
                    child: Text(
                      ('No program'),
                    ),
                  )
                : DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.primaryColor,
                          child: TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 3.0,
                            dividerColor: AppColors.primaryColor,
                            tabs: [
                              Text('Today'),
                              Text('Tomorrow'),
                            ],
                          ),
                        ),
                        Gap(AppSizes.spacingL),
                        Expanded(
                          child: TabBarView(children: [
                            ProgramByDayListWidget(programList.today),
                            ProgramByDayListWidget(programList.tomorrow),
                          ]),
                        ),
                      ],
                    ),
                  ),
          BaseError(failure: final failure) => Center(
              child: Text(
                failure.title,
                style: AppFontStyles.baseDescriptionStyle,
              ),
            ),
          _ => SizedBox()
        },
      ),
    );
  }
}
