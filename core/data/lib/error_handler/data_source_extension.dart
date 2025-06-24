import 'package:data/error_handler/datasource.dart';
import 'package:data/error_handler/response_code.dart';
import 'package:data/error_handler/response_message.dart';
import 'package:domain/entities/failure.dart';

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badResponse:
        return Failure(ResponseCode.badResponse, ResponseMessage.badResponse);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError, ResponseMessage.internalServerError);
      case DataSource.connectTimeOut:
        return Failure(ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSource.cancelled:
        return Failure(ResponseCode.cancelled, ResponseMessage.cancelled);
      case DataSource.receiveTimeOut:
        return Failure(ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

