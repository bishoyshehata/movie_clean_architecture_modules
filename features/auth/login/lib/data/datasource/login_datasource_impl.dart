import 'package:dartz/dartz.dart';
import 'package:data/network/api_safe_call.dart';
import 'package:data/network_info/network_info.dart';
import 'package:domain/entities/failure.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/service/login_service.dart';
import 'login_datasource.dart';

class LoginDataSourceImpl implements LoginDataSource {

  final LoginService loginService ;
  final NetworkInfo networkInfo;
  LoginDataSourceImpl(this.loginService ,this.networkInfo);

  @override
  Future<Either<Failure,LoginResponse>> login(LoginRequest loginRequest) async{
    return safeApiCall( networkInfo, () async {
      final response = await loginService.login(loginRequest.phone, loginRequest.password);
      return response.data;
    });
  }

}