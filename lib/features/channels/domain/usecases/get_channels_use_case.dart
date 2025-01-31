import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/domain/repositories/channel_repository.dart';

class GetChannelsUseCase {
  final ChannelRepository _channelRepository;

  GetChannelsUseCase(this._channelRepository);

  EitherFailureOr<List<Channel>> call() async {
    final result = await _channelRepository.getChannels();

    if (result.isLeft) {
      return Left(Failure(title: result.left.title));
    }

    return Right(result.right);
  }
}
