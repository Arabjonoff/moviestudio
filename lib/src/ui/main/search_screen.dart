import 'package:flutter/material.dart';
import 'package:moviestudio/src/bloc/serach_bloc.dart';
import 'package:moviestudio/src/model/popular_movie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      searchBloc.getSearchMovie(controller.text);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
      ),
      body:StreamBuilder<PopularMovieModel>(
          stream: searchBloc.searchGetMovie,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.results.length,
                scrollDirection: Axis.vertical,
                  itemBuilder: (context,i){
                return Container(
                  width: 200,
                  height: 200,
                  child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data!.results[i].backdropPath}'),
                );
              });
            }
            return Center(child: CircularProgressIndicator());
          }
      ),
    );
  }
}
