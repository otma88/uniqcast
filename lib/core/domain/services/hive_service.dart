abstract class HiveService {
  Future<void> saveXml(String xmlData);

  Future<String?> readXml();

  Future<void> removeXml();
}
