import 'package:movies/domain/model/cached_movie_model.dart';

abstract class MoviesCachedDataSource {
  Future<List<CachedMovieModel>> getMovies();

  Future<void> cachedMovies(List<CachedMovieModel> movies);

  Future<bool> hasValidCache();
}
