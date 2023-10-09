import 'dart:async';

import 'package:moviestudio/src/model/http_result.dart';
import 'package:moviestudio/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/popular_movie.dart';

class SearchBloc{
  final Repository _repository = Repository();
  final _fetchSearchMovie = PublishSubject<PopularMovieModel>();
  Stream<PopularMovieModel> get searchGetMovie => _fetchSearchMovie.stream;


  getSearchMovie(query)async{
    HttpResult response = await _repository.liveSearch(query);
    if(response.isSuccess){
      var data = PopularMovieModel.fromJson(response.result);
      _fetchSearchMovie.sink.add(data);
    }
  }
}

final searchBloc = SearchBloc();