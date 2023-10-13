import 'dart:async';
import 'package:moviestudio/src/model/http_result.dart';
import 'package:moviestudio/src/model/movie_detail.dart';
import 'package:moviestudio/src/model/plater_model.dart';
import 'package:moviestudio/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';


class PlayerBloc{
  final Repository _repository = Repository();
  final _fetchDetailMovie = PublishSubject<PlayerModel>();
  Stream<PlayerModel> get playerStream => _fetchDetailMovie.stream;


  getPlayer(id)async{
    HttpResult response = await _repository.moviePlayer(id);
    if(response.isSuccess){
      var data = PlayerModel.fromJson(response.result);
      _fetchDetailMovie.sink.add(data);
    }
  }
}
final playerBloc = PlayerBloc();