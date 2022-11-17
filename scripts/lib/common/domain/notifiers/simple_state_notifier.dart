// ignore_for_file: always_use_package_imports

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/failure.dart';
import '../providers/global_failure_provider.dart';
import '../providers/global_loading_provider.dart';

abstract class SimpleStateNotifier<T> extends StateNotifier<T> {
  final Ref ref;

  SimpleStateNotifier(this.ref, T initialState) : super(initialState);

  ///Show [BaseLoadingIndicator] above the entire app
  @protected
  void showGlobalLoading() =>
      ref.read(globalLoadingProvider.notifier).update((state) => true);

  ///Clear [BaseLoadingIndicator]
  @protected
  void clearGlobalLoading() =>
      ref.read(globalLoadingProvider.notifier).update((state) => false);

  @protected
  void setGlobalFailure(Failure? failure) {
    clearGlobalLoading();
    ref.read(globalFailureProvider.notifier).update((state) => failure);
  }
}
