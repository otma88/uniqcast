import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:uniqcast/core/data/remote_data_source/xml_remote_data_source.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';
import 'package:uniqcast/features/channels/domain/repositories/channel_repository.dart';
import 'package:xml/xml.dart';

class ChannelsRepositoryImpl implements ChannelRepository {
  final XmlRemoteDataSource _xmlRemoteDataSource;

  final HiveService _hiveService;

  final ResponseMapper<Channel, XmlElement> _responseMapper;

  ChannelsRepositoryImpl(
    this._xmlRemoteDataSource,
    this._hiveService,
    this._responseMapper,
  );

  @override
  EitherFailureOr<List<Channel>> getChannels() async {
    try {
      final xmlHiveResult = await _hiveService.readXml();

      final xmlResult =
          xmlHiveResult ?? await _xmlRemoteDataSource.getXmlData();

      final xml = XmlDocument.parse(xmlResult!);
      final xmlChannelsElements = xml.findAllElements('channel');

      final channels = xmlChannelsElements.map(_responseMapper).toList();

      return Right(channels);
    } catch (e) {
      return Left(Failure.generic(title: 'Failed to load channels'));
    }
  }
}
