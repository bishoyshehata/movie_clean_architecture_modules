import 'package:extensions/constants/constants.dart';
import 'package:extensions/extensions.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/domain/models/login_model.dart';

import '../../domain/models/error_model.dart';
import '../datasource/error_handler/error_response.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      name: this?.name.orEmpty() ?? Constants.empty,
      phone: this?.phone.orEmpty() ?? Constants.empty,
      accessToken: this?.accessToken.orEmpty() ?? Constants.empty,
      age: this?.age.orZero() ?? Constants.zero,
    );
  }
}
extension ErrorResponseMapper on ErrorResponse? {
  ErrorModel toDomain() {
    return ErrorModel(
      message: this?.message.orEmpty() ?? Constants.empty,
      statusCode: this?.statusCode.orZero() ?? Constants.zero,
    );
  }
}
