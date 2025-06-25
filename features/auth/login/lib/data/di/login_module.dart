import 'package:data/network_info/network_info.dart';
import 'package:data/network_info/network_info_impl.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:login/data/datasource/login_datasource_impl.dart';
import 'package:login/data/repository/login_repository_impl.dart';
import 'package:login/data/service/login_service.dart';
import 'package:login/domain/repository/login_repository.dart';
import 'package:login/domain/usecase/login_usecase_impl.dart';
import '../datasource/login_datasource.dart';

@module
abstract class LoginModule {
  @lazySingleton // when we need it ,we have to provide it
  LoginService provideLoginService(Dio dio){
    return LoginService(dio);
  }
  @lazySingleton // when we need it ,we have to provide it
  NetworkInfo provideNetworkInfo(){
    return NetworkInfoImpl();
  }
  @lazySingleton // when we need it ,we have to provide it
  LoginDataSource provideLoginDataSource(LoginService loginService, NetworkInfo networkInfo){
    return LoginDataSourceImpl(loginService, networkInfo);
  }
  @lazySingleton // when we need it ,we have to provide it
  LoginRepository provideLoginRepository(LoginDataSource loginDataSource){
    return LoginRepositoryImpl(loginDataSource);
  }
  @lazySingleton // when we need it ,we have to provide it
  LoginUseCaseImpl provideLoginUseCase(LoginRepository loginRepository){
    return LoginUseCaseImpl(loginRepository);
  }
}