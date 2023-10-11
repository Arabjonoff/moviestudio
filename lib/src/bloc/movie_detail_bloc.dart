import 'dart:async';
import 'package:moviestudio/src/model/http_result.dart';
import 'package:moviestudio/src/model/movie_detail.dart';
import 'package:moviestudio/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';


class MovieDetailBloc{
  final Repository _repository = Repository();
  final _fetchDetailMovie = PublishSubject<MovieDetailModel>();
  Stream<MovieDetailModel> get searchGetMovie => _fetchDetailMovie.stream;


  getDetailMovie(id)async{
    HttpResult response = await _repository.movieDetail(id);
    if(response.isSuccess){
      var data = MovieDetailModel.fromJson(response.result);
    _fetchDetailMovie.sink.add(data);
    }
  }
}
final movieDetailBloc = MovieDetailBloc();