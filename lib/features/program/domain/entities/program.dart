import 'package:equatable/equatable.dart';

class Program extends Equatable {
  final String title;
  final String description;

  final DateTime startTime;

  final DateTime stopTime;

  final bool isCurrent;

  const Program(
    this.title,
    this.description,
    this.startTime,
    this.stopTime, {
    this.isCurrent = false,
  });

  Program copyWith({required bool isCurrent}) {
    return Program(
      title,
      description,
      startTime,
      stopTime,
      isCurrent: isCurrent,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        startTime,
        startTime,
      ];
}
