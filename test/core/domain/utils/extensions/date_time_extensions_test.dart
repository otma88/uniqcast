import 'package:flutter_test/flutter_test.dart';
import 'package:uniqcast/core/domain/utils/extensions/date_time_extensions.dart';

void main() {
  group('DateTimeExtensions', () {
    test('formattedHHmm should return correct HH:mm format', () {
      final dateTime = DateTime(
        2025,
        1,
        31,
        9,
        5,
      );
      final formattedTime = dateTime.formattedHHmm;

      expect(formattedTime, '09:05');
    });

    test(
      'formattedHHmm should return correct HH:mm format with double digits',
      () {
        final dateTime = DateTime(
          2025,
          1,
          31,
          15,
          45,
        );

        final formattedTime = dateTime.formattedHHmm;

        expect(formattedTime, '15:45');
      },
    );

    test('formattedHHmm should handle midnight correctly', () {
      final dateTime = DateTime(2025, 1, 31, 0, 0); // 00:00 (midnight)

      final formattedTime = dateTime.formattedHHmm;

      expect(formattedTime, '00:00');
    });

    test('formattedHHmm should handle single-digit minutes correctly', () {
      final dateTime = DateTime(2025, 1, 31, 23, 7); // 23:07 (11:07 PM)

      final formattedTime = dateTime.formattedHHmm;

      expect(formattedTime, '23:07');
    });
  });
}
