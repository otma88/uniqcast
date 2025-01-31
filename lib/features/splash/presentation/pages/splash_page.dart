import 'package:flutter/material.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/constants/app_sizes.dart';
import 'package:uniqcast/core/domain/router/pages.dart';
import 'package:uniqcast/features/channels/di.dart';
import 'package:uniqcast/theme/app_colors.dart';
import 'package:uniqcast/theme/font_styles.dart';

class SplashPage extends HookConsumerWidget {
  static const routeName = Pages.splash;
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelsState = ref.watch(channelsNotifierProvider);

    ref.listen(
      channelsNotifierProvider,
      (_, next) => switch (next) {
        BaseData(data: _) =>
          Navigator.pushReplacementNamed(context, Pages.home),
        BaseError(failure: final failure) => showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Text(failure.title),
            ),
          ),
        _ => Object(),
      },
    );

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            ref.read(channelsNotifierProvider.notifier).getChannels();
          },
        );
        return null;
      },
      [],
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: switch (channelsState) {
        BaseLoading() => Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Uniqcast_app',
                  style: AppFontStyles.baseTitleStyle.copyWith(fontSize: 30),
                ),
                Gap(AppSizes.spacingXXL),
                CircularProgressIndicator(),
              ],
            ),
        ),
        _ => SizedBox()
      },
    );
  }
}
