import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/repositories/program_repository.dart';
import 'package:uniqcast/features/program/domain/usecases/get_program_use_case.dart';
import 'package:flutter_architecture/flutter_architecture.dart';

class MockProgramRepository extends Mock implements ProgramRepository {}

void main() {
  late GetProgramUseCase getProgramUseCase;
  late MockProgramRepository mockProgramRepository;

  setUp(() {
    mockProgramRepository = MockProgramRepository();
    getProgramUseCase = GetProgramUseCase(mockProgramRepository);
  });

  group('GetProgramUseCase', () {
    const String channelId = '123';

    test(
      'should return a list of programs with isCurrent field correctly set',
      () async {
        final now = DateTime.now();
        final pastProgram = Program(
          'Past Program',
          'Past Description',
          now.subtract(Duration(hours: 2)),
          now.subtract(Duration(hours: 1)),
          isCurrent: false,
        );
        final currentProgram = Program(
          'Current Program',
          'Current Description',
          now.subtract(Duration(minutes: 30)),
          now.add(Duration(minutes: 30)),
          isCurrent: false,
        );
        final futureProgram = Program(
          'Future Program',
          'Future Description',
          now.add(Duration(hours: 1)),
          now.add(Duration(hours: 2)),
          isCurrent: false,
        );

        final programList = [pastProgram, currentProgram, futureProgram];

        when(() => mockProgramRepository.getProgramByChannel(channelId))
            .thenAnswer((_) async => Right(programList));

        final result = await getProgramUseCase(channelId);

        expect(result.isRight, true);
        expect(result.right.length, 3);
        expect(result.right.first.isCurrent, false);
        expect(result.right[1].isCurrent, true);
        expect(result.right[2].isCurrent, false);

        verify(() => mockProgramRepository.getProgramByChannel(channelId))
            .called(1);
      },
    );

    test('should return Failure when repository returns an error', () async {
      final failure = Failure(title: 'Failed to fetch program');

      when(() => mockProgramRepository.getProgramByChannel(channelId))
          .thenAnswer((_) async => Left(failure));

      final result = await getProgramUseCase(channelId);

      expect(result.isLeft, true);
      expect(result.left.title, 'Failed to fetch program');

      verify(() => mockProgramRepository.getProgramByChannel(channelId))
          .called(1);
    });
  });
}
