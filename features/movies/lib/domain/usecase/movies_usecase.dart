
import 'package:dartz/dartz.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:domain/entities/failure.dart';
import 'package:movies/domain/model/movie_model.dart';
import '../repository/movies_repository.dart';

class MoviesUseCase implements BaseUseCase<String,List<MovieModel>>{

  final MoviesRepository moviesRepository;

  MoviesUseCase(this.moviesRepository);

  @override
  // the input is not used in this case, so we can keep it as String or later may be like page number
  Future<Either<Failure, List<MovieModel>>> execute(String input) async {
    return await moviesRepository.getMovies();
  }
}