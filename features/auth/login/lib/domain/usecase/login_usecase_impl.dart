
import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/models/login_model.dart';
import 'package:login/domain/repository/login_repository.dart';

class LoginUseCaseImpl implements BaseUseCase<LoginRequest,LoginModel>{
  final LoginRepository loginRepository;
  LoginUseCaseImpl(this.loginRepository);

  @override
  Future<Either<Failure, LoginModel>> execute (LoginRequest input) async{
    return await loginRepository.login(input);
  }

}