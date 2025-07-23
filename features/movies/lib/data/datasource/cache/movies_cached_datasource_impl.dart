import 'package:hive/hive.dart';
import 'package:movies/data/datasource/cache/movies_cached_datasource.dart';
import 'package:movies/domain/model/cached_movie_model.dart';

class MoviesCachedDataSourceImpl implements MoviesCachedDataSource {

  static const _moviesCachedKey = 'moviesCachedKey' ;
  static const _cacheExpiryKey = 'cacheExpiryKey' ;
  static const _moviesCacheExpiryInSeconds = 60;
  final Box _box;
  MoviesCachedDataSourceImpl(this._box);

  @override
  Future<void> cachedMovies(List<CachedMovieModel> movies)async {

    await _box.put(_moviesCachedKey, movies);
    await _box.put(_cacheExpiryKey, DateTime.now().add(const Duration(seconds: _moviesCacheExpiryInSeconds)).toIso8601String());
  }

  @override
  Future<List<CachedMovieModel>> getMovies() async{
    return (_box.get(_moviesCachedKey,defaultValue: <CachedMovieModel>[]) as List).cast<CachedMovieModel>();
  }


  @override
  Future<bool> hasValidCache() async{

    final cacheExpiryTimeString =_box.get(_cacheExpiryKey);
    if(cacheExpiryTimeString == null) return false;

    final cacheExpiryTime =DateTime.parse(cacheExpiryTimeString);
   return DateTime.now().isBefore(cacheExpiryTime);

  }

}
