import 'package:flutter/material.dart';
import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/features/channels/di.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/presentation/widgets/channel_item.dart';
import 'package:uniqcast/features/program/di.dart';

class ChannelSliderWidget extends HookConsumerWidget {
  const ChannelSliderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelsState = ref.watch(channelsNotifierProvider);
    return SizedBox(
      height: 70,
      child: switch (channelsState) {
        BaseLoading() => CircularProgressIndicator(),
        BaseData<List<Channel>>(data: final channels) => channels.isEmpty
            ? Center(
                child: Text('No channels'),
              )
            : PageView(
                controller: PageController(viewportFraction: 0.5),
                children:
                    channels.map((channel) => ChannelItem(channel)).toList(),
                onPageChanged: (index) => ref
                    .read(programNotifierProvider.notifier)
                    .getProgram(channels[index].channelId),
              ),
        _ => SizedBox()
      },
    );
  }
}
