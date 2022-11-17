// ignore_for_file: always_use_package_imports

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/domain/entities/failure.dart';

part 'example_simple_state.freezed.dart';

@freezed
class ExampleSimpleState with _$ExampleSimpleState {
  const factory ExampleSimpleState.initial() = _Initial;

  const factory ExampleSimpleState.empty() = _Empty;

  const factory ExampleSimpleState.fetching() = _Fetching;

  const factory ExampleSimpleState.success(String sentence) = _Success;

  const factory ExampleSimpleState.error(Failure failure) = _Error;
}
