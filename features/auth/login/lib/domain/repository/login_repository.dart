import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';
import 'package:login/data/request/login_request.dart';
import '../models/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure,LoginModel>> login(LoginRequest loginRequest);
}