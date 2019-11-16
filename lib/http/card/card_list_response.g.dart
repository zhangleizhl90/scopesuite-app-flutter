// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardListResponse _$CardListResponseFromJson(Map<String, dynamic> json) {
  return CardListResponse(
    json['resCode'] as String,
    json['resMsg'] as String,
  );
}

Map<String, dynamic> _$CardListResponseToJson(CardListResponse instance) =>
    <String, dynamic>{
      'resCode': instance.resCode,
      'resMsg': instance.resMsg,
    };
