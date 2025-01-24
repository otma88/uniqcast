import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/data/clients/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uniqcast/main/app_environment.dart';

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
