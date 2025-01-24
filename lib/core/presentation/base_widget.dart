// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseWidget extends ConsumerWidget {
  final Widget child;

  const BaseWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLoading = ref.watch(globalLoadingProvider);
    return Stack(
      children: [
        child,
        if (showLoading) const BaseLoadingIndicator(),
      ],
    );
  }
}
