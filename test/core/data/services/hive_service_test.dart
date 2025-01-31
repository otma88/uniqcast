import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uniqcast/core/constants/app_constants.dart';
import 'package:uniqcast/core/data/services/hive_service_impl.dart';

class MockHiveBox extends Mock implements Box {}

void main() {
  late HiveServiceImpl hiveService;
  late MockHiveBox mockBox;

  setUpAll(() {
    registerFallbackValue(
      MockHiveBox(),
    );
  });

  setUp(() async {
    mockBox = MockHiveBox();
    hiveService = HiveServiceImpl();

    when(() => Hive.openBox(AppConstants.xmlHiveBox))
        .thenAnswer((_) async => mockBox);

    when(() => Hive.box(AppConstants.xmlHiveBox)).thenReturn(mockBox);
  });

  group('HiveServiceImpl', () {
    test('readXml() should return stored XML data', () async {
      when(() => mockBox.get('xmlData')).thenReturn('<xml>Test Data</xml>');

      final result = await hiveService.readXml();

      expect(result, '<xml>Test Data</xml>');
      verify(() => mockBox.get('xmlData')).called(1);
    });

    test('readXml() should return null when no data is stored', () async {
      when(() => mockBox.get('xmlData')).thenReturn(null);

      final result = await hiveService.readXml();

      expect(result, isNull);
      verify(() => mockBox.get('xmlData')).called(1);
    });

    test('saveXml() should store XML data in Hive', () async {
      when(() => mockBox.put('xmlData', any())).thenAnswer((_) async {});

      await hiveService.saveXml('<xml>New Data</xml>');

      verify(() => mockBox.put('xmlData', '<xml>New Data</xml>')).called(1);
    });

    test('removeXml() should clear the Hive box', () async {
      when(() => mockBox.clear()).thenAnswer((_) async => 0);

      await hiveService.removeXml();

      verify(() => mockBox.clear()).called(1);
    });
  });
}
