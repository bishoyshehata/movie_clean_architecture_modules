import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../response/movies_response.dart';
part 'movies_service.g.dart';

const String baseUrl = "https://api.mockfly.dev/mocks/5265cf39-de21-41d9-b5ce-9bd1e6956497";

@RestApi(baseUrl: baseUrl)
abstract class MoviesService {
  factory MoviesService(Dio dio, {String? baseUrl, ParseErrorLogger errorLogger }) = _MoviesService;

  @GET('/entertainment/movies')
  Future<HttpResponse<MoviesResponse>> getMovies();
}
