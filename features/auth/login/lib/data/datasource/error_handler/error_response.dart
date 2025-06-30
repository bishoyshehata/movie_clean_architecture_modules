
import 'package:json_annotation/json_annotation.dart';
part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse{
  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "statusCode")
  int? statusCode;

  ErrorResponse(this.message,this.statusCode);

  // from json
  factory ErrorResponse.fromJson(Map<String,dynamic> json )=> _$ErrorResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>  _$ErrorResponseToJson(this);

}