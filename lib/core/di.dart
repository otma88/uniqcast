import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/data/clients/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uniqcast/core/data/clients/dio_config.dart';
import 'package:uniqcast/core/data/remote_data_source/xml_remote_data_source.dart';
import 'package:uniqcast/core/data/services/hive_service_impl.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';
import 'package:uniqcast/main/app_environment.dart';

// ******** DATA LAYER ********
final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(
      dioProvider(
        DioConfig(
          EnvInfo.apiBaseUrl,
        ),
      ),
    ),
  ),
);

final dioProvider = Provider.family<Dio, DioConfig>((
  ref,
  config,
) {
  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      responseType: ResponseType.plain,
      headers: {'Accept': 'text/html,application/xml'},
    ),
  )..interceptors.addAll(
      [
        PrettyDioLogger(requestHeader: true, requestBody: true),
      ],
    );
  return dio;
});

final xmlRemoteDataSourceProvider = Provider<XmlRemoteDataSource>((ref) {
  return XmlRemoteDataSourceImpl(
    ref.watch(apiClientProvider),
    ref.watch(hiveServiceProvider),
  );
});

final hiveServiceProvider = Provider<HiveService>((ref) => HiveServiceImpl());
