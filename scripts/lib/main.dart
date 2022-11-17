// ignore_for_file: always_use_package_imports

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'common/utils/custom_provider_observer.dart';
import 'common/domain/providers/base_router_provider.dart';
import 'common/presentation/base_widget.dart';
import 'generated/l10n.dart';
import 'main/app_environment.dart';
import 'theme/themes.dart' as themes;

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  void runAppCallback() => runApp(ProviderScope(
        observers: [CustomProviderObserver()],
        child: const MyApp(),
      ));
  if (environment == AppEnvironment.PROD) {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'DSN';
      },
      appRunner: runAppCallback,
    );
  } else {
    runAppCallback();
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseRouter = ref.watch(baseRouterProvider);
    return BeamerProvider(
      routerDelegate: baseRouter.routerDelegate as BeamerDelegate,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: EnvInfo.environment != AppEnvironment.PROD,
        title: EnvInfo.appTitle,
        theme: themes.primaryTheme,
        localizationsDelegates: const [
          S.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        routerDelegate: baseRouter.routerDelegate,
        routeInformationParser: baseRouter.routeInformationParser,
        routeInformationProvider: baseRouter.routeInformationProvider,
        builder: (context, child) =>
            BaseWidget(child: child ?? const SizedBox()),
      ),
    );
  }
}
