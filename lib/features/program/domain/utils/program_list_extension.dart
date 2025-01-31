import 'package:uniqcast/features/program/domain/entities/program.dart';

extension ProgramListExtension on List<Program> {
  List<Program> get today {
    final now = DateTime.now();
    return where((program) =>
        program.startTime.year == now.year &&
        program.startTime.month == now.month &&
        program.startTime.day == now.day).toList();
  }

  List<Program> get tomorrow {
    final now = DateTime.now();
    final nextDay = now.add(Duration(days: 1));
    return where((program) =>
        program.startTime.year == nextDay.year &&
        program.startTime.month == nextDay.month &&
        program.startTime.day == nextDay.day).toList();
  }
}
