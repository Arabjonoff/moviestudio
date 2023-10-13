import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
@override
  void initState() {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'huXt6fdOWOg',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: YoutubePlayer(
        controller:  YoutubePlayerController(
        initialVideoId: 'huXt6fdOWOg',
        flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,)
      ))
    );
  }
}
