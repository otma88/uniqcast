import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/presentation/utils/extensions/ref_extension.dart';
import 'package:uniqcast/features/channels/di.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';

extension CurrentChannels on WidgetRef {
  List<Channel>? get currentChannelList =>
      getBaseDataWatchable(channelsNotifierProvider);
}
