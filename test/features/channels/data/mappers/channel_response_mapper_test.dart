import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xml/xml.dart' as xml;
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/data/mappers/channels_response_mapper.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('channelsResponseMapperProvider', () {
    test('should correctly map XML response to Channel entity', () {
      final xmlString = '''
        <channel id="123">
          <display-name>Test Channel</display-name>
          <url>https://test.com/stream</url>
          <icon src="https://test.com/icon.png" />
        </channel>
      ''';
      final document = xml.XmlDocument.parse(xmlString);
      final xmlElement = document.rootElement;
      final responseMapper = container.read(channelsResponseMapperProvider);

      final channel = responseMapper(xmlElement);

      expect(channel, isA<Channel>());
      expect(channel.channelId, '123');
      expect(channel.name, 'Test Channel');
      expect(channel.url, 'https://test.com/stream');
      expect(channel.iconUrl, 'https://test.com/icon.png');
    });

    test('should return empty string if attributes are missing', () {
      final xmlString = '''
        <channel>
          <display-name></display-name>
          <url></url>
          <icon />
        </channel>
      ''';
      final document = xml.XmlDocument.parse(xmlString);
      final xmlElement = document.rootElement;

      final responseMapper = container.read(channelsResponseMapperProvider);

      final channel = responseMapper(xmlElement);

      expect(channel.channelId, '');
      expect(channel.name, '');
      expect(channel.url, '');
      expect(channel.iconUrl, '');
    });

    test('should throw an error if required elements are missing', () {
      final xmlString = '''
        <channel id="123">
          <icon src="https://test.com/icon.png" />
        </channel>
      ''';
      final document = xml.XmlDocument.parse(xmlString);
      final xmlElement = document.rootElement;

      final responseMapper = container.read(channelsResponseMapperProvider);

      expect(() => responseMapper(xmlElement), throwsA(isA<StateError>()));
    });
  });
}
