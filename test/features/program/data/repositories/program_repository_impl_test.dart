import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';
import 'package:uniqcast/features/program/data/repositories/program_repository_impl.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:xml/xml.dart';
import 'package:flutter_architecture/flutter_architecture.dart';

class MockHiveService extends Mock implements HiveService {}

void main() {
  late ProgramRepositoryImpl repository;
  late MockHiveService mockHiveService;
  late Program Function(XmlElement) responseMapper;

  setUp(() {
    mockHiveService = MockHiveService();

    repository = ProgramRepositoryImpl(
      mockHiveService,
      (xmlElement) => responseMapper(xmlElement),
    );

    registerFallbackValue(XmlElement(XmlName('programme')));
  });

  group('ProgramRepositoryImpl', () {
    const String channelId = '123';

    test('should return a list of programs for the given channel', () async {
      const xmlData = '''
        <tv>
          <programme channel="123" start="20240130123045Z" stop="20240130133045Z">
            <title>Program 1</title>
            <desc>Description 1</desc>
          </programme>
          <programme channel="456" start="20240130143045Z" stop="20240130153045Z">
            <title>Program 2</title>
            <desc>Description 2</desc>
          </programme>
        </tv>
      ''';

      when(() => mockHiveService.readXml()).thenAnswer((_) async => xmlData);

      final xmlElement =
          XmlDocument.parse(xmlData).findAllElements('programme').first;

      final mockProgram = Program(
        'Program 1',
        'Description 1',
        DateTime.parse('2024-01-30T12:30:45Z').toLocal(),
        DateTime.parse('2024-01-30T13:30:45Z').toLocal(),
      );

      responseMapper = (XmlElement element) => mockProgram;

      final result = await repository.getProgramByChannel(channelId);

      expect(result.isRight, true);
      expect(result.right, [mockProgram]);

      verify(() => mockHiveService.readXml()).called(1);
    });

    test(
      'should return an empty list if no programs match the channel ID',
      () async {
        const xmlData = '''
        <tv>
          <programme channel="456" start="20240130143045Z" stop="20240130153045Z">
            <title>Program 2</title>
            <desc>Description 2</desc>
          </programme>
        </tv>
      ''';

        when(() => mockHiveService.readXml()).thenAnswer((_) async => xmlData);

        responseMapper =
            (XmlElement element) => throw StateError('No matching channel');

        final result = await repository.getProgramByChannel(channelId);

        expect(result.isRight, true);
        expect(result.right, isEmpty);

        verify(() => mockHiveService.readXml()).called(1);
      },
    );

    test('should return Failure when XML parsing fails', () async {
      when(() => mockHiveService.readXml()).thenThrow(Exception('Invalid XML'));

      final result = await repository.getProgramByChannel(channelId);

      expect(result.isLeft, true);
      expect(result.left, isA<Failure>());
      expect(result.left.title, 'Failed to load program for this channel');

      verify(() => mockHiveService.readXml()).called(1);
    });
  });
}
