import 'package:data/error_handler/app_strings.dart';

class ResponseMessage {

  static const String success = AppStrings.success;
  static const String noContent = AppStrings.noContent;
  static const String badResponse = AppStrings.badResponse;
  static const String forbidden = AppStrings.forbidden;
  static const String unauthorised = AppStrings.unauthorised;
  static const String internalServerError = AppStrings.internalServerError;

  // local errors from app
  static const String connectTimeOut = AppStrings.connectTimeOut;
  static const String cancelled = AppStrings.cancelled;
  static const String receiveTimeOut = AppStrings.receiveTimeOut;
  static const String sendTimeOut = AppStrings.sendTimeOut;
  static const String cacheError = AppStrings.cacheError;
  static const String noInternetConnection = AppStrings.noInternetConnection;
  static const String defaultError = AppStrings.defaultError ;
}