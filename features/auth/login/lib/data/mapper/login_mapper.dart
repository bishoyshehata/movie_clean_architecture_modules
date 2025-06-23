import 'package:extensions/constants/constants.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/domain/models/login_model.dart';

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      name: this?.name ?? Constants.empty,
      phone: this?.phone ?? Constants.empty,
      accessToken: this?.accessToken ?? Constants.empty,
      age: this?.age ?? Constants.zero,
    );
  }
}
