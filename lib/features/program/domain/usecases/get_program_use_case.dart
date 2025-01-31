import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/repositories/program_repository.dart';

class GetProgramUseCase {
  final ProgramRepository _programRepository;

  GetProgramUseCase(this._programRepository);

  EitherFailureOr<List<Program>> call(String channelId) async {
    final result = await _programRepository.getProgramByChannel(channelId);

    if (result.isLeft) {
      return Left(Failure(title: result.left.title));
    }

    DateTime now = DateTime.now();

    List<Program> programList = result.right.map((program) {
      bool isCurrent =
          now.isAfter(program.startTime) && now.isBefore(program.stopTime);
      return program.copyWith(isCurrent: isCurrent);
    }).toList();

    return Right(programList);
  }
}
