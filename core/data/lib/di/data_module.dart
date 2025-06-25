import 'package:data/factory/dio_factory.dart';
import 'package:datastore/provider/preferences/preferences_provider.dart';
import 'package:datastore/provider/sessions/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'data_module_strings.dart';

@module
abstract class DataModule {

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
