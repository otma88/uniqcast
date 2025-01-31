import 'package:flutter/material.dart';
import 'package:uniqcast/features/channels/domain/entities/channel.dart';

class ChannelItem extends StatelessWidget {
  final Channel channel;

  const ChannelItem(this.channel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(channel.iconUrl);
  }
}
