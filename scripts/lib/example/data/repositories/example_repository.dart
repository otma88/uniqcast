// ignore_for_file: always_use_package_imports

import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/domain/either_failure_or.dart';
import '../../../common/domain/entities/failure.dart';

final exampleRepositoryProvider = Provider<ExampleRepository>((ref) {
  return SentenceRepository();
});

abstract class ExampleRepository {
  EitherFailureOr<String> getSomeString();

  EitherFailureOr<String> getSomeOtherString();
}

class SentenceRepository implements ExampleRepository {
  @override
  EitherFailureOr<String> getSomeString() async {
    await Future.delayed(const Duration(seconds: 3));
    if (Random().nextBool()) {
      return const Right('some sentence');
    } else {
      return Left(Failure.generic());
    }
  }

  @override
  EitherFailureOr<String> getSomeOtherString() async {
    await Future.delayed(const Duration(seconds: 3));
    if (Random().nextBool()) {
      return Right(Random().nextBool() ? 'Some sentence' : '');
    } else {
      return Left(Failure.generic());
    }
  }
}
