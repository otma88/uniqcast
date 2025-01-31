import 'package:flutter_architecture/base_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefExtensions on WidgetRef {
  T? getBaseDataWatchable<T>(ProviderListenable<BaseState> provider) {
    return switch (watch(provider)) {
      BaseData<T>(:final data) => data,
      _ => null,
    };
  }

  T? getBaseDataReadable<T>(ProviderListenable<BaseState> provider) {
    return switch (read(provider)) {
      BaseData<T>(:final data) => data,
      _ => null,
    };
  }
}

extension RefExtensions on Ref {
  T? getBaseDataReadable<T>(ProviderListenable<BaseState> provider) {
    return switch (read(provider)) {
      BaseData<T>(:final data) => data,
      _ => null,
    };
  }
}
