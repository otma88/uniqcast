import 'package:uniqcast/core/utils/logs/logger.dart';
import 'package:xml/xml.dart';

extension DateTimeParserExtension on XmlElement {
  DateTime? parseDateTime(String attributeName) {
    try {
      final attributeValue = getAttribute(attributeName);
      if (attributeValue == null) return null;
      String dateTimePart = attributeValue.substring(0, 14);
      String timeZonePart = attributeValue.substring(15);

      return DateTime.parse('${dateTimePart.substring(0, 4)}'
          '-${dateTimePart.substring(4, 6)}'
          '-${dateTimePart.substring(6, 8)}'
          'T${dateTimePart.substring(8, 10)}'
          ':${dateTimePart.substring(10, 12)}'
          ':${dateTimePart.substring(12, 14)}$timeZonePart');
    } catch (e) {
      logger.i('Error parsing $attributeName: $e');
      return null;
    }
  }
}
