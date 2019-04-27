import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse(this.id, this.token);

  final int id;
  @JsonKey(name: 'authentication_token')
  final String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return new LoginResponse(json["id"], json["authentication_token"]);
  }
}