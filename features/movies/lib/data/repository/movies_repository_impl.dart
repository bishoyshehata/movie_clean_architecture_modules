import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:movies/data/datasource/cache/movies_cached_datasource.dart';
import 'package:movies/domain/mapper/movies_mapper.dart';
import '../../domain/model/movie_model.dart';
import '../../domain/repository/movies_repository.dart';
import '../datasource/remote/movies_datasource.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;
  final MoviesCachedDataSource moviesCachedDataSource;
  MoviesRepositoryImpl(this.moviesDataSource,this.moviesCachedDataSource);
  @override
  Future<Either<Failure, List<MovieModel>>> getMovies() async {
    final result = await moviesDataSource.getMovies();

    return result.fold((failure){
      return Left(failure);
    }, (response){
      return Right(response.toDomain());
    });
  }

}