import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/service/login_service.dart';
import 'package:retrofit/dio.dart';
import 'login_datasource.dart';

class LoginDataSourceImpl implements LoginDataSource {

  final LoginService loginService ;
  LoginDataSourceImpl(this.loginService);

  @override
  Future<HttpResponse<LoginResponse>> login(LoginRequest loginRequest) async{
    return await loginService.login(loginRequest.email, loginRequest.password);
  }

}