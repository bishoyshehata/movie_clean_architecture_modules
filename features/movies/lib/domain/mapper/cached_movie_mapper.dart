import 'package:movies/domain/model/cached_movie_model.dart';
import 'package:movies/domain/model/movie_model.dart';

extension CacheToMovieMapper on CachedMovieModel {
  MovieModel toDomain() {
    return MovieModel(
      id: id,
      posterPath: posterPath,
      voteAverage: voteAverage,
      originalTitle: originalTitle,
      title: title,
      overview: overview,
      releaseDate: releaseDate,
    );
  }
}

extension MovieToCacheMapper on MovieModel {
  CachedMovieModel toDomain() {
    return CachedMovieModel(
      id: id,
      posterPath: posterPath,
      voteAverage: voteAverage,
      originalTitle: originalTitle,
      title: title,
      overview: overview,
      releaseDate: releaseDate,
    );
  }
}
