// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/network_info/network_info.dart' as _i131;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies/data/datasource/cache/movies_cached_datasource.dart'
    as _i386;
import 'package:movies/data/datasource/remote/movies_datasource.dart' as _i214;
import 'package:movies/data/di/movie_module.dart' as _i649;
import 'package:movies/data/service/movies_service.dart' as _i809;
import 'package:movies/domain/repository/movies_repository.dart' as _i591;
import 'package:movies/domain/usecase/movies_usecase.dart' as _i365;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final moviesModule = _$MoviesModule();
    await gh.factoryAsync<_i979.Box<dynamic>>(
      () => moviesModule.provideMoviesBox(),
      preResolve: true,
    );
    gh.lazySingleton<_i809.MoviesService>(
        () => moviesModule.provideMoviesService(gh<_i361.Dio>()));
    gh.lazySingleton<_i386.MoviesCachedDataSource>(() =>
        moviesModule.provideMoviesCachedDataSource(gh<_i979.Box<dynamic>>()));
    gh.lazySingleton<_i214.MoviesDataSource>(
        () => moviesModule.provideMoviesDataSource(
              gh<_i809.MoviesService>(),
              gh<_i131.NetworkInfo>(),
            ));
    gh.lazySingleton<_i591.MoviesRepository>(
        () => moviesModule.provideMoviesRepository(
              gh<_i214.MoviesDataSource>(),
              gh<_i386.MoviesCachedDataSource>(),
            ));
    gh.lazySingleton<_i365.MoviesUseCase>(
        () => moviesModule.provideMoviesUseCase(gh<_i591.MoviesRepository>()));
    return this;
  }
}

class _$MoviesModule extends _i649.MoviesModule {}
