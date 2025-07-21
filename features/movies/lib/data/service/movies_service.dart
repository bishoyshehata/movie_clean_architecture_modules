import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/movies_response.dart';
part 'movies_service.g.dart';

const String baseUrl = "";

@RestApi(baseUrl: baseUrl)
abstract class MoviesService {
  factory MoviesService(Dio dio, {String? baseUrl, ParseErrorLogger errorLogger }) = _MoviesService;

  @GET('/entertainment/movies')
  Future<HttpResponse<MoviesResponse>> getMovies();
}
