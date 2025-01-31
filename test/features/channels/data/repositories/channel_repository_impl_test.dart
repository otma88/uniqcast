import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/core/data/remote_data_source/xml_remote_data_source.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';
import 'package:uniqcast/features/channels/data/repositories/channels_repository_impl.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:xml/xml.dart';

class MockXmlRemoteDataSource extends Mock implements XmlRemoteDataSource {}

class MockHiveService extends Mock implements HiveService {}

void main() {
  late ChannelsRepositoryImpl repository;
  late MockXmlRemoteDataSource mockXmlRemoteDataSource;
  late MockHiveService mockHiveService;
  late Channel Function(XmlElement) responseMapper;

  setUp(() {
    mockXmlRemoteDataSource = MockXmlRemoteDataSource();
    mockHiveService = MockHiveService();

    repository = ChannelsRepositoryImpl(
      mockXmlRemoteDataSource,
      mockHiveService,
      (xmlElement) => responseMapper(xmlElement),
    );

    registerFallbackValue(XmlDocument());
    registerFallbackValue(XmlElement(XmlName('channel')));
  });

  group('ChannelsRepositoryImpl', () {
    test(
      'should return a list of channels from Hive if data is available',
      () async {
        const xmlData = '''
        <tv>
          <channel id="1">
            <display-name>Channel 1</display-name>
            <url>https://test.com/stream1</url>
            <icon src="https://test.com/icon1.png" />
          </channel>
        </tv>
      ''';

        when(() => mockHiveService.readXml()).thenAnswer((_) async => xmlData);
        when(() => mockXmlRemoteDataSource.getXmlData())
            .thenAnswer((_) async => null);

        final xmlElement =
            XmlDocument.parse(xmlData).findAllElements('channel').first;
        final mockChannel = Channel('1', 'Channel 1',
            'https://test.com/stream1', 'https://test.com/icon1.png');

        responseMapper = (XmlElement element) => mockChannel;

        final result = await repository.getChannels();

        expect(result.isRight, true);
        expect(result.right, [mockChannel]);

        verify(() => mockHiveService.readXml()).called(1);
        verifyNever(() => mockXmlRemoteDataSource.getXmlData());
      },
    );

    test('should fetch XML from remote when Hive is empty', () async {
      const xmlData = '''
        <tv>
          <channel id="2">
            <display-name>Channel 2</display-name>
            <url>https://test.com/stream2</url>
            <icon src="https://test.com/icon2.png" />
          </channel>
        </tv>
      ''';

      when(() => mockHiveService.readXml()).thenAnswer((_) async => null);
      when(() => mockXmlRemoteDataSource.getXmlData())
          .thenAnswer((_) async => xmlData);

      final xmlElement =
          XmlDocument.parse(xmlData).findAllElements('channel').first;
      final mockChannel = Channel('2', 'Channel 2', 'https://test.com/stream2',
          'https://test.com/icon2.png');

      responseMapper = (XmlElement element) => mockChannel;

      final result = await repository.getChannels();

      expect(result.isRight, true);
      expect(result.right, [mockChannel]);

      verify(() => mockHiveService.readXml()).called(1);
      verify(() => mockXmlRemoteDataSource.getXmlData()).called(1);
    });

    test('should return Failure when XML parsing fails', () async {
      when(() => mockHiveService.readXml()).thenAnswer((_) async => null);
      when(() => mockXmlRemoteDataSource.getXmlData())
          .thenThrow(Exception('Invalid XML'));

      final result = await repository.getChannels();

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
      expect(result.left.title, 'Failed to load channels');

      verify(() => mockHiveService.readXml()).called(1);
      verify(() => mockXmlRemoteDataSource.getXmlData()).called(1);
    });
  });
}
