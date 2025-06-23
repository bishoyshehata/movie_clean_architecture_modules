
import 'package:login/data/response/login_response.dart';
import 'package:retrofit/retrofit.dart';
import '../request/login_request.dart';

abstract class LoginDataSource {
  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest);
}