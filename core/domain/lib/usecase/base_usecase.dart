
import 'package:dartz/dartz.dart';
import 'package:domain/entities/failure.dart';

abstract class BaseUseCase<In,Out> {
  Future<Either<Failure,Out>> execute(In input);
}