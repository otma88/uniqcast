import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';

abstract interface class ChannelRepository {
  EitherFailureOr<List<Channel>> getChannels();
}
