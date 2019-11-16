import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse(this.resCode, this.resMsg, this.authToken);

  @JsonKey()
  final String resCode;

  @JsonKey()
  final String resMsg;

  @JsonKey()
  final String authToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}