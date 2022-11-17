// ignore_for_file: always_use_package_imports

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/domain/notifiers/base_state.dart';
import '../../../../common/domain/notifiers/base_state_notifier.dart';
import '../../../data/repositories/example_repository.dart';

final exampleNotifierProvider =
    StateNotifierProvider<ExampleStateNotifier, BaseState<String>>(
  (ref) => ExampleStateNotifier(ref.watch(exampleRepositoryProvider), ref),
);

class ExampleStateNotifier extends BaseStateNotifier<String> {
  final ExampleRepository _exampleRepository;

  ExampleStateNotifier(this._exampleRepository, super.ref);

  Future getSomeStringFullExample() => execute(
        //Function that is called. Needs to have the same success return type as State
        _exampleRepository.getSomeString(),

        //Set to true if you want to handle error globally (ex. Show error dialog above the entire app)
        globalFailure: true,

        //Set to true if you want to show BaseLoadingIndicator above the entire app
        globalLoading: false,

        //Set to true if you want to update state to BaseState.loading()
        withLoadingState: true,

        //Do some actions with data
        //If you return true, base state will be updated to BaseState.data(data)
        //If you return false, state will not be updated
        onDataReceived: (data) {
          // Custom handle data
          return true;
        },

        //Do some actions with failure
        //If you return true, base state will be updated to BaseState.error(failure)
        //If you return false, state will not be updated
        onFailureOccurred: (failure) {
          // Custom handle data
          return true;
        },
      );

  //Example of the API request with global loading indicator
  Future getSomeStringGlobalLoading() => execute(
        _exampleRepository.getSomeString(),
        globalLoading: true,
        withLoadingState: false,
      );
}
