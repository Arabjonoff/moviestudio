import 'package:flutter/material.dart';
import 'package:moviestudio/src/bloc/movie_detail_bloc.dart';
import 'package:moviestudio/src/model/movie_detail.dart';
import 'package:moviestudio/src/provider/repository.dart';
import 'package:moviestudio/src/theme/app_colors.dart';
import 'package:moviestudio/src/ui/player_screen.dart';
import 'package:moviestudio/src/utils/file_import.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool isPLay = false;
  Repository repository = Repository();
  @override
  void initState() {
    movieDetailBloc.getDetailMovie(widget.id);
    repository.moviePlayer(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.bg,
      body: StreamBuilder<MovieDetailModel>(
        stream: movieDetailBloc.searchGetMovie,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                    height: 300.h,
                    child: isPLay?PlayerScreen(url: snapshot.data!.backdropPath??"", id: snapshot.data!.id??0,):Stack(
                      children: [
                        SizedBox(
                            height: double.infinity,
                            child: Image.network("https://image.tmdb.org/t/p/w500/${snapshot.data!.backdropPath}",fit: BoxFit.cover,),
                        ),
                        Positioned(
                          top: 100,
                            left: MediaQuery.of(context).size.width/2.5,
                            child: IconButton(onPressed: (){
                              setState(() {
                                isPLay = true;
                              });
                            }, icon: const Icon(Icons.play_arrow,color: Colors.white,size: 70,)))
                      ],
                    )),
                Text(snapshot.data!.releaseDate.toString()??''),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.genres!.length,
                        itemBuilder: (context,i){
                          return Card(
                              elevation: 10,
                              color: Colors.grey.shade700,
                              child: Text(snapshot.data!.genres![i].name??"",style: TextStyle(color: Colors.white),));
                        }),
                  ),
                ),
                Text(snapshot.data!.title.toString()??'',style: TextStyle(fontSize: 30),),
                Text(snapshot.data!.overview??''),
                Text(snapshot.data!.originalTitle??''),
                Text(snapshot.data!.productionCompanies![0].name??''),
              ],
            );
          }
          return Container(color: Colors.green,);
        }
      ),
    );
  }
}
