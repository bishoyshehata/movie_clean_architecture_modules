import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';

import '../model/movie_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure,List<MovieModel>>> getMovies();
}