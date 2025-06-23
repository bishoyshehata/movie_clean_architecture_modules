
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{
  @JsonKey(name: "name")
   String? name;

  @JsonKey(name: "phone")
   String? phone;

  @JsonKey(name: "accessToken")
   String? accessToken;

  @JsonKey(name: "age")
   int? age;

  LoginResponse(this.name,this.accessToken,this.phone,this.age);

  // from json
  factory LoginResponse.fromJson(Map<String,dynamic> json )=> _$LoginResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>  _$LoginResponseToJson(this);

}