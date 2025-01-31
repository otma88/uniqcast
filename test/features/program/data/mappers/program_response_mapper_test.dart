import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xml/xml.dart' as xml;
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/data/mappers/program_response_mapper.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('ProgramResponseMapper', () {
    test('should correctly map XML response to Program entity', () {
      final xmlString = '''
        <programme start="20240130123045Z" stop="20240130133045Z">
          <title>Test Program</title>
          <desc>Test description</desc>
        </programme>
      ''';
      final document = xml.XmlDocument.parse(xmlString);
      final xmlElement = document.rootElement;

      final responseMapper = container.read(programResponseMapperProvider);

      final program = responseMapper(xmlElement);

      expect(program, isA<Program>());
      expect(program.title, 'Test Program');
      expect(program.description, 'Test description');
      expect(
        program.startTime,
        DateTime.parse('2024-01-30T12:30:45'),
      );
      expect(
        program.stopTime,
        DateTime.parse('2024-01-30T13:30:45'),
      );
    });

    test('should throw error if required elements are missing', () {
      final xmlString = '''
        <programme start="20240130123045Z">
          <title>Test Program</title>
        </programme>
      ''';
      final document = xml.XmlDocument.parse(xmlString);
      final xmlElement = document.rootElement;

      final responseMapper = container.read(programResponseMapperProvider);

      expect(() => responseMapper(xmlElement), throwsA(isA<StateError>()));
    });
  });
}
