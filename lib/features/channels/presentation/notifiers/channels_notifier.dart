import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/domain/usecases/get_channels_use_case.dart';

final selectedChannelIdProvider = StateProvider<String>((ref) => '');

class ChannelsNotifier extends BaseStateNotifier<List<Channel>> {
  final GetChannelsUseCase _getChannelsUseCase;

  ChannelsNotifier(this._getChannelsUseCase, super.ref);

  void getChannels() => execute(_getChannelsUseCase());
}
