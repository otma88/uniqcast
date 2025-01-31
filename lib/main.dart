// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/constants/app_constants.dart';
import 'package:uniqcast/core/domain/router/routes.dart';
import 'package:uniqcast/core/presentation/widgets/base_widget.dart';
import 'package:uniqcast/core/utils/logs/custom_provider_observer.dart';

import 'generated/l10n.dart';
import 'main/app_environment.dart';

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  await Hive.initFlutter();
  if (!Hive.isBoxOpen(AppConstants.xmlHiveBox)) {
    await Hive.openBox(AppConstants.xmlHiveBox);
  }
  void runAppCallback() => runApp(ProviderScope(
        observers: [CustomProviderObserver()],
        child: const MyApp(),
      ));
  runAppCallback();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: EnvInfo.environment != AppEnvironment.PROD,
      title: EnvInfo.appTitle,
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      routes: routes,
      builder: (context, child) => BaseWidget(child: child ?? const SizedBox()),
    );
  }
}
