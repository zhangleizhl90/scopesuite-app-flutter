
import 'package:json_annotation/json_annotation.dart';

part 'submit_response.g.dart';

@JsonSerializable()
class SubmitResponse {

  SubmitResponse(this.resCode,
                 this.resMsg);

  @JsonKey()
  final String resCode;

  @JsonKey()
  final String resMsg;

  factory SubmitResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitResponseToJson(this);
}