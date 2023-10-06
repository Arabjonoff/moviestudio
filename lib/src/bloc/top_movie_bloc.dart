import 'dart:async';

import 'package:moviestudio/src/model/http_result.dart';
import 'package:moviestudio/src/model/top_movie_model.dart';
import 'package:moviestudio/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';
class TopBloc{
  final Repository _repository = Repository();
  final _fetchPopularMovie = PublishSubject<TopMovieModel>();
  Stream<TopMovieModel> get topGetMovie => _fetchPopularMovie.stream;


  getTopMovie()async{
    HttpResult response = await _repository.getPopularMovie();
    if(response.isSuccess){
      var data = TopMovieModel.fromJson(response.result);
      _fetchPopularMovie.sink.add(data);
    }
  }
}

final tobBloc = TopBloc();