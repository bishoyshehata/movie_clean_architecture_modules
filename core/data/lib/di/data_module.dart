import 'package:data/factory/dio_factory.dart';
import 'package:datastore/provider/preferences/preferences_provider.dart';
import 'package:datastore/provider/preferences/preferences_provider_impl.dart';
import 'package:datastore/provider/sessions/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_module_strings.dart';

@module
abstract class DataModule {
  @preResolve // before using any dependency from this module just make sure of creating instance of sharedPreferences
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  PreferencesProvider providePreferencesProviderImpl(SharedPreferences prefs)=>PreferencesProviderImpl(prefs);

  //provide base url
  @Named(DataModuleStrings.baseUrlKey) // a tag fot this String
  String provideBaseUrl(PreferencesProvider preferencesProvider) => preferencesProvider.getBaseUrl();    /// preferences provider

  @Named(DataModuleStrings.accessTokenKey)               /// session provider
  String provideAccessToken(SessionProvider sessionProvider) => sessionProvider.getAccessToken();    /// preferences provider

  @Named(DataModuleStrings.languageKey)                  /// preferences provider
  String provideLanguage(PreferencesProvider preferencesProvider) => preferencesProvider.getAppLanguage();    /// preferences provider


  @lazySingleton // when we need it ,we have to provide it
  Future<Dio> dio(
    @Named(DataModuleStrings.baseUrlKey) String baseUrl,
    @Named(DataModuleStrings.accessTokenKey) Future<String> accessToken,
    @Named(DataModuleStrings.languageKey) Future<String> language,
  ) async {
    final dioFactory = DioFactory(
      baseUrl: baseUrl,
      accessToken: await accessToken,
      language: await language,
    );
    return dioFactory.getDio();
  }
}
