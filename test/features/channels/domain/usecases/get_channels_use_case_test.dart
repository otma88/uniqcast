import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/domain/repositories/channel_repository.dart';
import 'package:uniqcast/features/channels/domain/usecases/get_channels_use_case.dart';
import 'package:flutter_architecture/flutter_architecture.dart';

class MockChannelRepository extends Mock implements ChannelRepository {}

void main() {
  late GetChannelsUseCase getChannelsUseCase;
  late MockChannelRepository mockChannelRepository;

  setUp(() {
    mockChannelRepository = MockChannelRepository();
    getChannelsUseCase = GetChannelsUseCase(mockChannelRepository);
  });

  group('GetChannelsUseCase', () {
    test(
      'should return a list of channels when repository call is successful',
      () async {
        final channels = [
          Channel(
            '1',
            'Channel 1',
            'https://test.com/stream1',
            'https://test.com/icon1.png',
          ),
          Channel(
            '2',
            'Channel 2',
            'https://test.com/stream2',
            'https://test.com/icon2.png',
          ),
        ];

        when(() => mockChannelRepository.getChannels())
            .thenAnswer((_) async => Right(channels));

        final result = await getChannelsUseCase();
        expect(result.isRight, true);
        expect(result.right, channels);
        verify(() => mockChannelRepository.getChannels()).called(1);
      },
    );

    test('should return a Failure when repository returns an error', () async {
      final failure = Failure(title: 'Failed to fetch channels');

      when(() => mockChannelRepository.getChannels())
          .thenAnswer((_) async => Left(failure));

      final result = await getChannelsUseCase();

      expect(result.isLeft, true);
      expect(result.left.title, 'Failed to fetch channels');
      verify(() => mockChannelRepository.getChannels()).called(1);
    });
  });
}
