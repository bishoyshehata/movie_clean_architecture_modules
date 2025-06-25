import 'package:dio/dio.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/usecase/login_usecase_impl.dart';
import 'package:movie_clean_architecture_modules/di/injection.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  Dio dio = Dio();
}

void doLogin()async {
  final loginUseCase = getIt<LoginUseCaseImpl>();
  final loginRequest = LoginRequest("bisho@gmail.com", "123456");

  final result = await loginUseCase.execute(loginRequest);

  result.fold((failure){
    print("Errrror ${failure.message}");
    print("Errrror ${failure.statusCode}");
  }, (response){
    print("ussssssser Name is ${response.name}");
  });

}