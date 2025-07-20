
abstract class PreferencesProvider{
  String getBaseUrl();
  String getAppLanguage();

  void setAppLanguage(String language);
  void setBaseUrl(String baseUrl);
}