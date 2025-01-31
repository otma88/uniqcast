import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/di.dart';
import 'package:uniqcast/features/channels/data/mappers/channels_response_mapper.dart';
import 'package:uniqcast/features/channels/data/repositories/channels_repository_impl.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/domain/repositories/channel_repository.dart';
import 'package:uniqcast/features/channels/domain/usecases/get_channels_use_case.dart';
import 'package:uniqcast/features/channels/presentation/notifiers/channels_notifier.dart';

// ********* DATA LAYER *********
final _channelsRepositoryProvider = Provider<ChannelRepository>(
  (ref) => ChannelsRepositoryImpl(
    ref.watch(xmlRemoteDataSourceProvider),
    ref.watch(hiveServiceProvider),
    ref.watch(channelsResponseMapperProvider),
  ),
);

// ******** DOMAIN LAYER ********
final _getChannelsUseCaseProvider = Provider<GetChannelsUseCase>(
  (ref) => GetChannelsUseCase(
    ref.watch(_channelsRepositoryProvider),
  ),
);

// ***** PRESENTATION LAYER ******
final channelsNotifierProvider =
    StateNotifierProvider<ChannelsNotifier, BaseState<List<Channel>>>(
  (ref) => ChannelsNotifier(ref.watch(_getChannelsUseCaseProvider), ref),
);
