
import 'package:data/error_handler/data_source_extension.dart';
import 'package:data/error_handler/datasource.dart';
import 'package:dio/dio.dart';
import 'package:domain/entities/failure.dart';

class Errorhandler implements Exception {
  late Failure failure ;
  Errorhandler.handle(dynamic error){
    if(error is DioException){
      failure = handleError(error);
    }else{
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure handleError(DioException error) {
  switch (error.type){
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();

    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();

    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode ?? 0;
      switch (statusCode) {
        case 400:
          return DataSource.defaultError.getFailure();
        case 401:
          return DataSource.unauthorised.getFailure();
        case 403:
          return DataSource.forbidden.getFailure();
        case 500:
          return DataSource.internalServerError.getFailure();
        case 204:
          return DataSource.noContent.getFailure();
        default:
          return Failure(statusCode, error.response?.statusMessage ?? "");
      }
    case DioExceptionType.cancel:
      return DataSource.cancelled.getFailure();

    case DioExceptionType.connectionError:
      return DataSource.connectTimeOut.getFailure();

    case DioExceptionType.unknown:
      return DataSource.defaultError.getFailure();

    default:
      if(error.response!=null&&error.response?.statusCode!=null&&error.response?.statusMessage!=null){
        return Failure(error.response?.statusCode ?? 0, error.response?.statusMessage ?? "");
      }else{
        return DataSource.defaultError.getFailure();
      }
  }
}