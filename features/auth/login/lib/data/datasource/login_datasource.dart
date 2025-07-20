
import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:login/data/response/login_response.dart';
import '../request/login_request.dart';

abstract class LoginDataSource {
  Future<Either<Failure,LoginResponse>> login(LoginRequest loginRequest);
}