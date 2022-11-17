// ignore_for_file: always_use_package_imports

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../main/app_environment.dart';
import 'api_client.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.read(
      _buildDioProviderWith(baseUrl: EnvInfo.apiBaseUrl),
    ),
  ),
);

Provider<Dio> _buildDioProviderWith({
  required String baseUrl,
}) =>
    Provider<Dio>(
      (ref) => Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.addAll(
          [
            PrettyDioLogger(requestHeader: true, requestBody: true),
          ],
        ),
    );
