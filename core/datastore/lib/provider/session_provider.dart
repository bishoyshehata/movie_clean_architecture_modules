
abstract class SessionProvider {
  String getAccessToken();
  String getRefreshToken();
  String getClientId();
  String getUserId();
}