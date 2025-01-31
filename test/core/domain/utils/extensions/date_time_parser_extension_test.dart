import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/core/domain/utils/extensions/date_time_parser_extension.dart';
import 'package:xml/xml.dart';

class MockLogger extends Mock {
  void i(String message);
}

void main() {
  late MockLogger mockLogger;

  setUp(() {
    mockLogger = MockLogger();
  });

  group('DateTimeParserExtension', () {
    test('should parse valid date-time attribute correctly', () {
      final xmlElement = XmlDocument.parse(
        '<root dateTime="20250131222700 +0100"></root>',
      ).rootElement;

      final parsedDateTime = xmlElement.parseDateTime('dateTime');

      expect(parsedDateTime, isNotNull);
      expect(parsedDateTime?.year, 2025);
      expect(parsedDateTime?.month, 1);
      expect(parsedDateTime?.day, 31);
      expect(parsedDateTime?.hour, 21);
      expect(parsedDateTime?.minute, 27);
      expect(parsedDateTime?.second, 0);
    });

    test('should return null if attribute does not exist', () {
      final xmlElement = XmlDocument.parse('<root></root>').rootElement;

      final parsedDateTime = xmlElement.parseDateTime('missingAttribute');

      expect(parsedDateTime, isNull);
    });

    test('should return null if the attribute is null', () {
      final xmlElement =
          XmlDocument.parse('<root dateTime=""></root>').rootElement;
      final parsedDateTime = xmlElement.parseDateTime('dateTime');

      expect(parsedDateTime, isNull);
    });
  });
}
