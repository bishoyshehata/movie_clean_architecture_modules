import 'package:data/network_info/network_info.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repository/movies_repository.dart';
import '../../domain/usecase/movies_usecase.dart';
import '../datasource/movies_datasource.dart';
import '../datasource/movies_datasource_impl.dart';
import '../repository/movies_repository_impl.dart';
import '../service/movies_service.dart';

@module
abstract class MoviesModule {
  @lazySingleton // when we need it ,we have to provide it
  MoviesService provideMoviesService(Dio dio){
    return MoviesService(dio);
  }

  @lazySingleton // when we need it ,we have to provide it
  MoviesDataSource provideMoviesDataSource(MoviesService moviesService, NetworkInfo networkInfo){
    return MoviesDataSourceImpl(moviesService, networkInfo);
  }
  @lazySingleton // when we need it ,we have to provide it
  MoviesRepository provideMoviesRepository(MoviesDataSource moviesDataSource){
    return MoviesRepositoryImpl(moviesDataSource);
  }
  @lazySingleton // when we need it ,we have to provide it
  MoviesUseCase provideMoviesUseCase(MoviesRepository moviesRepository){
    return MoviesUseCase(moviesRepository);
  }
}