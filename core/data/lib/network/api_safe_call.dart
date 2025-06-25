import 'package:dartz/dartz.dart';
import 'package:data/error_handler/data_source_extension.dart';
import 'package:data/error_handler/datasource.dart';
import 'package:data/error_handler/dio_error_handler.dart';
import 'package:data/network_info/network_info.dart';
import 'package:domain/entities/failure.dart';

Future<Either<Failure, T >> safeApiCall<T>(NetworkInfo networkInfo , Future<T> Function() apiCall) async {
  if(await networkInfo.isConnected){
    try
    {
      final response = await apiCall();
      return Right(response);
    }catch(error){
      return Left(Errorhandler.handle(error).failure);
    }
  }
  else {
    // no internet connection
    return Left(DataSource.noInternetConnection.getFailure());

  }
}