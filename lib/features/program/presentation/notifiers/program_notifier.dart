import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/usecases/get_program_use_case.dart';

class ProgramNotifier extends BaseStateNotifier<List<Program>> {
  final GetProgramUseCase _getProgramUseCase;

  ProgramNotifier(this._getProgramUseCase, super.ref);

  void getProgram(String channelId) => execute(_getProgramUseCase(channelId));
}
