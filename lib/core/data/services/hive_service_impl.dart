import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uniqcast/core/constants/app_constants.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';

class HiveServiceImpl implements HiveService {
  @override
  Future<String?> readXml() async {
    final box = Hive.box(AppConstants.xmlHiveBox);
    final hiveXml = await box.get('xmlData');
    return hiveXml as String?;
  }

  @override
  Future<void> saveXml(String xmlData) async {
    final box = Hive.box(AppConstants.xmlHiveBox);
    await box.put('xmlData', xmlData);
  }

  @override
  Future<void> removeXml() async {
    final box = Hive.box(AppConstants.xmlHiveBox);
    await box.clear();
  }
}
