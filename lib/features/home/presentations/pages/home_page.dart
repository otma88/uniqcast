import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/core/domain/router/pages.dart';
import 'package:uniqcast/core/presentation/utils/extensions/channels_extension.dart';
import 'package:uniqcast/features/channels/presentation/notifiers/channels_notifier.dart';
import 'package:uniqcast/features/home/presentations/widgets/channel_slider_widget.dart';
import 'package:uniqcast/features/home/presentations/widgets/program_list_widget.dart';
import 'package:uniqcast/features/program/di.dart';
import 'package:uniqcast/theme/app_colors.dart';

class HomePage extends HookConsumerWidget {
  static const routeName = Pages.home;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.currentChannelList;

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            if (channels != null && channels.isNotEmpty) {
              ref
                  .read(selectedChannelIdProvider.notifier)
                  .update((_) => channels.first.channelId);
              ref
                  .watch(programNotifierProvider.notifier)
                  .getProgram(channels.first.channelId);
            }
          },
        );
        return null;
      },
      [],
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacingL),
          child: Column(
            children: [
              ChannelSliderWidget(),
              Gap(AppSizes.spacingXL),
              ProgramListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
