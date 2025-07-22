import 'package:dartz/dartz.dart';
import 'package:data/network/api_safe_call.dart';
import 'package:data/network_info/network_info.dart';
import 'package:domain/entities/failure.dart';
import 'package:movies/data/response/movies_response.dart';
import '../../service/movies_service.dart';
import 'movies_datasource.dart';

class MoviesDataSourceImpl implements MoviesDataSource {
  final MoviesService moviesService;
  final NetworkInfo networkInfo;

  MoviesDataSourceImpl(this.moviesService, this.networkInfo);

  @override
  Future<Either<Failure, MoviesResponse>> getMovies() {
    return safeApiCall(networkInfo, () async {
      final response = await moviesService.getMovies();
      return response.data;
    });
  }
}
