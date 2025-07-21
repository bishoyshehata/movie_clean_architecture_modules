  import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:movies/data/model/mapper/movies_mapper.dart';
import '../datasource/movies_datasource.dart';
import '../model/movie_model.dart';
import '../../domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSource moviesDataSource;
  MoviesRepositoryImpl(this.moviesDataSource);
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