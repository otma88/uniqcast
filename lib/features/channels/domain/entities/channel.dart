import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  final String channelId;

  final String name;

  final String url;

  final String iconUrl;

  const Channel(
    this.channelId,
    this.name,
    this.url,
    this.iconUrl,
  );

  @override
  List<Object?> get props => [
        channelId,
        name,
        url,
        iconUrl,
      ];
}
