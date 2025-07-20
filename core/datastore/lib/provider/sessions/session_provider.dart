
abstract class SessionProvider {
  String getAccessToken();
  String getRefreshToken();
  String getClientId();
  String getUserId();

  void setAccessToken(String accessToken);
  void setRefreshToken(String refreshToken);
  void setUserId(String userId);
}