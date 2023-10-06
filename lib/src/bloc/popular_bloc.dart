import 'dart:async';

import 'package:moviestudio/src/model/http_result.dart';
import 'package:moviestudio/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/popular_movie.dart';

class PopularBloc{
  final Repository _repository = Repository();
  final _fetchPopularMovie = PublishSubject<PopularMovieModel>();
  Stream<PopularMovieModel> get popularGetMovie => _fetchPopularMovie.stream;


  getPopularMovie()async{
    HttpResult response = await _repository.getPopularMovie();
    if(response.isSuccess){
      var data = PopularMovieModel.fromJson(response.result);
      _fetchPopularMovie.sink.add(data);
    }
  }
}

final popularBloc = PopularBloc();