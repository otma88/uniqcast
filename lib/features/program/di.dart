import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/di.dart';
import 'package:uniqcast/features/program/data/mappers/program_response_mapper.dart';
import 'package:uniqcast/features/program/data/repositories/program_repository_impl.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/repositories/program_repository.dart';
import 'package:uniqcast/features/program/domain/usecases/get_program_use_case.dart';
import 'package:uniqcast/features/program/presentation/notifiers/program_notifier.dart';

// ********* DATA LAYER *********
final _programRepositoryProvider = Provider<ProgramRepository>(
  (ref) => ProgramRepositoryImpl(
    ref.watch(hiveServiceProvider),
    ref.watch(programResponseMapperProvider),
  ),
);

// ******** DOMAIN LAYER ********
final _getProgramUseCaseProvider = Provider<GetProgramUseCase>(
  (ref) => GetProgramUseCase(
    ref.watch(_programRepositoryProvider),
  ),
);

// ***** PRESENTATION LAYER ******
final programNotifierProvider =
    StateNotifierProvider<ProgramNotifier, BaseState<List<Program>>>(
        (ref) => ProgramNotifier(ref.watch(_getProgramUseCaseProvider), ref),);
