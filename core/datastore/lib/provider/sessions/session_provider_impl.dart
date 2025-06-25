import 'package:datastore/provider/sessions/session_provider.dart';
import 'package:datastore/provider/sessions/session_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class ProdSessionProviderImpl extends SessionProvider {
  final SharedPreferences _sharedPreferences;
  ProdSessionProviderImpl(this._sharedPreferences);

  @override
  String getAccessToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey)??"";
  }
  @override
  void setAccessToken(accessToken) {
    _sharedPreferences.setString(SessionStrings.accessTokenKey,accessToken);
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(SessionStrings.refreshTokenKey)??"";
  }

  @override
  void setRefreshToken(refreshToken) {
    _sharedPreferences.setString(SessionStrings.refreshTokenKey,refreshToken);
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(SessionStrings.userIdKey)??"";
  }
  @override
  void setUserId(userId) {
    _sharedPreferences.setString(SessionStrings.userIdKey,userId);
  }
  @override
  String getClientId() {
    return Uuid().v4();
  }

}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionProviderImpl extends SessionProvider {

  final SharedPreferences _sharedPreferences;
  DevSessionProviderImpl(this._sharedPreferences);
  @override
  String getAccessToken() {
    return _sharedPreferences.getString(SessionStrings.accessTokenKey)??"";
  }
  @override
  void setAccessToken(accessToken) {
    _sharedPreferences.setString(SessionStrings.accessTokenKey,accessToken);
  }

  @override
  String getRefreshToken() {
    return _sharedPreferences.getString(SessionStrings.refreshTokenKey)??"";
  }

  @override
  void setRefreshToken(refreshToken) {
    _sharedPreferences.setString(SessionStrings.refreshTokenKey,refreshToken);
  }

  @override
  String getUserId() {
    return _sharedPreferences.getString(SessionStrings.userIdKey)??"";
  }
  @override
  void setUserId(userId) {
    _sharedPreferences.setString(SessionStrings.userIdKey,userId);
  }
  @override
  String getClientId() {
    return Uuid().v4();
  }

}
