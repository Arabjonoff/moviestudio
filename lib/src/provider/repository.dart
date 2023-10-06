import 'package:moviestudio/src/provider/api_provider.dart';

import '../model/http_result.dart';
class Repository{
  final ApiProvider _provider = ApiProvider();
  Future<HttpResult> getPopularMovie() => _provider.popularMovie();
  Future<HttpResult> topMovie() => _provider.topMovie();
}