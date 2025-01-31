import 'package:either_dart/either.dart';
import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:uniqcast/core/domain/services/hive_service.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program/domain/repositories/program_repository.dart';
import 'package:xml/xml.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final HiveService _hiveService;

  final ResponseMapper<Program, XmlElement> _responseMapper;

  ProgramRepositoryImpl(this._hiveService, this._responseMapper);

  @override
  EitherFailureOr<List<Program>> getProgramByChannel(String channelId) async {
    try {
      final xmlHive = await _hiveService.readXml();

      final xmlDocument = XmlDocument.parse(xmlHive!);

      final xmlPrograms =
          xmlDocument.findAllElements('programme').where((element) {
        final channel = element.getAttribute('channel');
        return channel == channelId;
      });

      final programs = xmlPrograms.map(_responseMapper).toList();

      return Right(programs);
    } catch (e) {
      return Left(
        Failure.generic(title: 'Failed to load program for this channel'),
      );
    }
  }
}
