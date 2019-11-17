
import 'package:json_annotation/json_annotation.dart';

part 'submit_request.g.dart';

@JsonSerializable()
class SubmitRequest {

  SubmitRequest(this.cardId, this.isVerified, this.comment);

  @JsonKey()
  final int cardId;

  @JsonKey()
  final bool isVerified;

  @JsonKey()
  final String comment;

  factory SubmitRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitRequestToJson(this);
}