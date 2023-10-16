import 'package:flutter/material.dart';
import 'package:moviestudio/src/bloc/player_bloc.dart';
import 'package:moviestudio/src/model/player_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  final String url;
  final int id;
  const PlayerScreen({super.key, required this.id, required this.url});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
@override
  void initState() {
  playerBloc.getPlayer(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerModel>(
      stream: playerBloc.playerStream,
      builder: (context, snapshot) {
     if(snapshot.hasData){
       return YoutubePlayer(
           controller:  YoutubePlayerController(
               initialVideoId: snapshot.data!.results![0].key??"",
               flags:  YoutubePlayerFlags(
                 autoPlay: true,)
           ));
     }return Image.network('https://image.tmdb.org/t/p/w500/${widget.url}');
      }
    );
  }
}
