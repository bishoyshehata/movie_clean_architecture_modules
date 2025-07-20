
import 'package:datastore/provider/preferences/preferences_provider.dart';
import 'package:datastore/provider/preferences/preferences_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProviderImpl implements PreferencesProvider {
  final SharedPreferences _sharedPreferences ;
  PreferencesProviderImpl(this._sharedPreferences);

  @override
  String getAppLanguage() {
    return _sharedPreferences.getString(PreferencesStrings.appLanguageKey) ?? PreferencesStrings.defaultAppLanguageKey;
  }
  @override
  void setAppLanguage(String language) {
    _sharedPreferences.setString(PreferencesStrings.appLanguageKey,language);
  }

  @override
  String getBaseUrl() {
    return _sharedPreferences.getString(PreferencesStrings.baseUrlKey) ?? PreferencesStrings.defaultBaseUrlKey;

  }
  @override
  void setBaseUrl(String baseUrl) {
    _sharedPreferences.setString(PreferencesStrings.baseUrlKey,baseUrl);
  }
  
}