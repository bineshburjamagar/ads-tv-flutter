import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
    required this.link,
  });
  final String link;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.link);
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(
      controller: _betterPlayerController,
    );
  }
}
