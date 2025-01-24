// ignore_for_file: always_use_package_imports

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../main/app_environment.dart';

final logger = Logger(
  printer: PrettyPrinter(),
  filter: LoggerFilter(),
);

//ignore: prefer-match-file-name
class LoggerFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => !EnvInfo.isProduction || kDebugMode;
}
