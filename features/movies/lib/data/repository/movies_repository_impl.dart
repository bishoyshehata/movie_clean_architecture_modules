import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:movies/data/datasource/cache/movies_cached_datasource.dart';
import 'package:movies/domain/mapper/cached_movie_mapper.dart';
import 'package:movies/domain/mapper/movies_mapper.dart';
import '../../domain/model/movie_model.dart';
import '../../domain/repository/movies_repository.dart';
import '../datasource/remote/movies_datasource.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;
  final MoviesCachedDataSource moviesCachedDataSource;

  MoviesRepositoryImpl(this.moviesDataSource, this.moviesCachedDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getMovies() async {
    if (await moviesCachedDataSource.hasValidCache()) {
      // fetch from the cache
      final cachedMovies = await moviesCachedDataSource.getMovies();
      return Right(
        cachedMovies.map((cachedMovie) => cachedMovie.toMovie()).toList(),
      );
    } else {
      // fetch from server
      final result = await moviesDataSource.getMovies();

      return result.fold(
        (failure) {
          return Left(failure);
        },
        (response) async {
          // this for caching
          await moviesCachedDataSource.cachedMovies(
            response.movies!
                .map((movie) => movie.toDomain().toCachedMovie())
                .toList(),
          );
          return Right(response.toDomain());
        },
      );
    }
  }
}
