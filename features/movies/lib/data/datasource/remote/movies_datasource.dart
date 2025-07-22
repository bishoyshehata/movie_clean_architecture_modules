import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:movies/data/response/movies_response.dart';

abstract class MoviesDataSource {
  Future<Either<Failure,MoviesResponse>> getMovies();
}