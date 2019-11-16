import 'package:json_annotation/json_annotation.dart';

part 'card_list_response.g.dart';

@JsonSerializable()
class CardListResponse {

  CardListResponse(this.resCode, this.resMsg);

  @JsonKey()
  final String resCode;

  @JsonKey()
  final String resMsg;


  factory CardListResponse.fromJson(Map<String, dynamic> json) =>
      _$CardListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardListResponseToJson(this);
}
