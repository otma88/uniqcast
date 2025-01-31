import 'dart:developer';

import 'package:uniqcast/core/data/clients/api_client.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';

abstract class XmlRemoteDataSource {
  Future<String?> getXmlData();
}

class XmlRemoteDataSourceImpl implements XmlRemoteDataSource {
  final ApiClient _apiClient;

  final HiveService _hiveService;

  XmlRemoteDataSourceImpl(this._apiClient, this._hiveService);

  @override
  Future<String?> getXmlData() async {
    try {
      final response = await _apiClient.getXmlData();
      await _hiveService.saveXml(response);
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
