import 'package:datastore/provider/sessions/session_provider.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SessionProvider, env: [Environment.prod])
class ProdSessionProviderImpl extends SessionProvider {
  @override
  String getAccessToken() {
    return 'AccessToken';
  }

  @override
  String getClientId() {
    return '1111111';
  }

  @override
  String getRefreshToken() {
    return 'RefreshToken';
  }

  @override
  String getUserId() {
    return '10101010';
  }
}

@Injectable(as: SessionProvider, env: [Environment.dev])
class DevSessionProviderImpl extends SessionProvider {
  @override
  String getAccessToken() {
    return 'AccessToken';
  }

  @override
  String getClientId() {
    return '2222222';
  }

  @override
  String getRefreshToken() {
    return 'RefreshToken';
  }

  @override
  String getUserId() {
    return '20202020';
  }
}
