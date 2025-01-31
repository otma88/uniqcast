import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:xml/xml.dart' as xml;

final channelsResponseMapperProvider =
    Provider<ResponseMapper<Channel, xml.XmlElement>>(
  (ref) => (response) => Channel(
        response.getAttribute('id') ?? '',
        response.findElements('display-name').first.innerText,
        response.findElements('url').first.innerText,
        response.findElements('icon').first.getAttribute('src') ?? '',
      ),
);
