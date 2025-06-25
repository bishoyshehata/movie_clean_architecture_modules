import 'package:data/factory/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {
  @preResolve // before using any dependency from this module just make sure of creating instance of sharedPreferences
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  //provide base url
  @Named("BaseUrl") // a tag fot this String
  String get baseUrl => "base_url";    /// preferences provider

  @Named("AccessToken")               /// session provider
  Future<String> get accessToken async {
    // return th value
  }

  @Named("Language")                  /// preferences provider
  Future<String> get language async {
    // return th value
  }

  @lazySingleton // when we need it ,we have to provide it
  Future<Dio> dio(
    @Named("BaseUrl") String baseUrl,
    @Named("AccessToken") Future<String> accessToken,
    @Named("Language") Future<String> language,
  ) async {
    final dioFactory = DioFactory(
      baseUrl: baseUrl,
      accessToken: await accessToken,
      language: await language,
    );
    return dioFactory.getDio();
  }
}
