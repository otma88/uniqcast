import 'package:flutter_architecture/flutter_architecture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/core/domain/utils/extensions/date_time_parser_extension.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:xml/xml.dart' as xml;

final programResponseMapperProvider =
    Provider<ResponseMapper<Program, xml.XmlElement>>(
  (ref) => (response) => Program(
        response.findElements('title').first.innerText,
        response.findElements('desc').first.innerText,
        response.parseDateTime('start')!.toLocal(),
        response.parseDateTime('stop')!.toLocal(),
      ),
);
