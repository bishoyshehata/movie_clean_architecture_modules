import 'package:data/network_info/network_info.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/datasource/cache/movies_cached_datasource.dart';
import 'package:movies/data/datasource/cache/movies_cached_datasource_impl.dart';
import 'package:movies/domain/model/cached_movie_model.dart';
import '../../domain/repository/movies_repository.dart';
import '../../domain/usecase/movies_usecase.dart';
import '../datasource/remote/movies_datasource.dart';
import '../datasource/remote/movies_datasource_impl.dart';
import '../repository/movies_repository_impl.dart';
import '../service/movies_service.dart';

@module
abstract class MoviesModule {
  @preResolve
  Future<Box<dynamic>> provideMoviesBox()async {
    Hive.registerAdapter(CachedMovieModelAdapter());
    return Hive.openBox<dynamic>("moviesBox");
  }

  @lazySingleton // when we need it ,we have to provide it
  MoviesService provideMoviesService(Dio dio){
    return MoviesService(dio);
  }

  @lazySingleton // when we need it ,we have to provide it
  MoviesDataSource provideMoviesDataSource(MoviesService moviesService, NetworkInfo networkInfo){
    return MoviesDataSourceImpl(moviesService, networkInfo);
  }
  @lazySingleton // when we need it ,we have to provide it
  MoviesCachedDataSource provideMoviesCachedDataSource(Box<dynamic> box){
    return MoviesCachedDataSourceImpl(box);
  }
  @lazySingleton // when we need it ,we have to provide it
  MoviesRepository provideMoviesRepository(MoviesDataSource moviesDataSource ,MoviesCachedDataSource moviesCachedDataSource){
    return MoviesRepositoryImpl(moviesDataSource,moviesCachedDataSource);
  }
  @lazySingleton // when we need it ,we have to provide it
  MoviesUseCase provideMoviesUseCase(MoviesRepository moviesRepository){
    return MoviesUseCase(moviesRepository);
  }
}