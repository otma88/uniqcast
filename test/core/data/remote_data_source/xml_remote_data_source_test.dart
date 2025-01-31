import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/core/data/clients/api_client.dart';
import 'package:uniqcast/core/data/remote_data_source/xml_remote_data_source.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockHiveService extends Mock implements HiveService {}

void main() {
  late XmlRemoteDataSourceImpl xmlRemoteDataSource;
  late MockApiClient mockApiClient;
  late MockHiveService mockHiveService;

  setUp(() {
    mockApiClient = MockApiClient();
    mockHiveService = MockHiveService();
    xmlRemoteDataSource =
        XmlRemoteDataSourceImpl(mockApiClient, mockHiveService);

    registerFallbackValue(Future.value());
  });

  group('XmlRemoteDataSourceImpl', () {
    test('should return XML data when API call is successful', () async {
      const mockXmlData = '<xml>Data</xml>';
      when(() => mockApiClient.getXmlData())
          .thenAnswer((_) async => mockXmlData);
      when(() => mockHiveService.saveXml(any())).thenAnswer((_) async {});

      final result = await xmlRemoteDataSource.getXmlData();

      expect(result, mockXmlData);
      verify(() => mockApiClient.getXmlData()).called(1);
      verify(() => mockHiveService.saveXml(mockXmlData)).called(1);
    });

    test(
      'should return null and log error when API call throws an exception',
      () async {
        when(() => mockApiClient.getXmlData())
            .thenThrow(Exception('API Error'));
        when(() => mockHiveService.saveXml(any())).thenAnswer((_) async {});

        final result = await xmlRemoteDataSource.getXmlData();

        expect(result, isNull);
        verify(() => mockApiClient.getXmlData()).called(1);
        verifyNever(() => mockHiveService.saveXml(any()));
      },
    );
  });
}
