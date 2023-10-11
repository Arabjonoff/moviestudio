import 'package:flutter/material.dart';
import 'package:moviestudio/src/bloc/movie_detail_bloc.dart';
import 'package:moviestudio/src/model/movie_detail.dart';
import 'package:moviestudio/src/theme/app_colors.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    movieDetailBloc.getDetailMovie(widget.id);
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
            return Column(
              children: [
                Image.network("https://image.tmdb.org/t/p/w500/${snapshot.data!.backdropPath}"),
                Text(snapshot.data!.title??''),
                Text(snapshot.data!.releaseDate.toString()??''),
                Text(snapshot.data!.budget.toString()??''),
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
