
import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:login/data/datasource/login_datasource.dart';
import 'package:login/data/mapper/login_mapper.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/models/login_model.dart';
import 'package:login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;
  LoginRepositoryImpl(this.loginDataSource);
  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    final result = await loginDataSource
        .login(loginRequest);

    return result.fold((failure){
      return Left(failure);
    }, (response){
      return Right(response.toDomain());
    });
  }

}