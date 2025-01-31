import 'package:flutter_test/flutter_test.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/utils/program_list_extension.dart';

void main() {
  group('ProgramListExtension', () {
    test('should return programs airing today', () {
      // Arrange
      final now = DateTime.now();
      final todayProgram1 = Program(
        'Today Show 1',
        'Description 1',
        now.subtract(Duration(hours: 1)),
        now.add(Duration(hours: 1)),
      );
      final todayProgram2 = Program(
        'Today Show 2',
        'Description 2',
        now.add(Duration(hours: 2)),
        now.add(Duration(hours: 3)),
      );
      final tomorrowProgram = Program(
        'Tomorrow Show',
        'Description 3',
        now.add(Duration(days: 1)),
        now.add(Duration(days: 1, hours: 1)),
      );

      final programList = [todayProgram1, todayProgram2, tomorrowProgram];

      final todayPrograms = programList.today;

      expect(todayPrograms.length, 2);
      expect(todayPrograms.contains(todayProgram1), true);
      expect(todayPrograms.contains(todayProgram2), true);
      expect(todayPrograms.contains(tomorrowProgram), false);
    });

    test('should return programs airing tomorrow', () {
      final now = DateTime.now();
      final tomorrow = now.add(Duration(days: 1));

      final todayProgram = Program(
        'Today Show',
        'Description 1',
        now,
        now.add(Duration(hours: 1)),
      );
      final tomorrowProgram1 = Program(
        'Tomorrow Show 1',
        'Description 2',
        tomorrow.add(Duration(hours: 1)),
        tomorrow.add(Duration(hours: 2)),
      );
      final tomorrowProgram2 = Program(
        'Tomorrow Show 2',
        'Description 3',
        tomorrow.add(Duration(hours: 3)),
        tomorrow.add(Duration(hours: 4)),
      );

      final programList = [todayProgram, tomorrowProgram1, tomorrowProgram2];

      final tomorrowPrograms = programList.tomorrow;

      expect(tomorrowPrograms.length, 2);
      expect(tomorrowPrograms.contains(tomorrowProgram1), true);
      expect(tomorrowPrograms.contains(tomorrowProgram2), true);
      expect(tomorrowPrograms.contains(todayProgram), false);
    });

    test('should return an empty list if no programs match today', () {
      final now = DateTime.now();
      final tomorrow = now.add(Duration(days: 1));

      final tomorrowProgram = Program('Tomorrow Show', 'Description 1',
          tomorrow, tomorrow.add(Duration(hours: 1)),);

      final programList = [tomorrowProgram];

      final todayPrograms = programList.today;

      expect(todayPrograms, isEmpty);
    });

    test('should return an empty list if no programs match tomorrow', () {
      final now = DateTime.now();
      final todayProgram = Program(
        'Today Show',
        'Description 1',
        now,
        now.add(Duration(hours: 1)),
      );

      final programList = [todayProgram];

      final tomorrowPrograms = programList.tomorrow;

      expect(tomorrowPrograms, isEmpty);
    });
  });
}
