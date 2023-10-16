import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviestudio/src/model/http_result.dart';
String _baseUrl = 'http://api.themoviedb.org/3/';

class ApiProvider {
  _getRequest(url) async {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDI5ZGE0ZDVmMmNiNTA3NGRkOTA5NzlkMjIzNWNjZCIsInN1YiI6IjYzNGZlZGM5YmU0YjM2MDA4NGU0OGNjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ip8Nk-uIKu4Wfz4mFFFd1ohboe_s9Fd6OGlH6B0Nstk"
      }
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    }
    else{
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    }
  }


  Future<HttpResult> popularMovie() async{
    String url = "${_baseUrl}movie/popular?language=ruS&page=1";
    return await _getRequest(url);
  }

  Future<HttpResult> topMovie() async{
    String url = "${_baseUrl}movie/top_rated?language=ru&page=1";
    return await _getRequest(url);
  }

  Future<HttpResult> liveSearch(query)async{
    String url = '${_baseUrl}search/movie?query=$query&include_adult=false&language=ru&page=1';
    return await _getRequest(url);
  }

  Future<HttpResult> movieDetail(id)async{
    String url = '${_baseUrl}movie/$id?language=ru';
    return await _getRequest(url);
  }
  Future<HttpResult> moviePlayer(id)async{
    String url = '${_baseUrl}movie/$id/videos?language=ru';
    return await _getRequest(url);
  }

}
