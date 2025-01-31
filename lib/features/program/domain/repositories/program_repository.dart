import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';

abstract interface class ProgramRepository {
  EitherFailureOr<List<Program>> getProgramByChannel(String channelId);
}
