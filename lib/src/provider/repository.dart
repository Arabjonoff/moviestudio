import 'package:moviestudio/src/provider/api_provider.dart';

import '../model/http_result.dart';
class Repository{
  final ApiProvider _provider = ApiProvider();
  Future<HttpResult> getPopularMovie() => _provider.popularMovie();
  Future<HttpResult> topMovie() => _provider.topMovie();
  Future<HttpResult> liveSearch(query) => _provider.liveSearch(query);
  Future<HttpResult> movieDetail(id) => _provider.movieDetail(id);
  Future<HttpResult> moviePlayer(id) => _provider.moviePlayer(id);
}