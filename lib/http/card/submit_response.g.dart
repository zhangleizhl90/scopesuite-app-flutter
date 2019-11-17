// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitResponse _$SubmitResponseFromJson(Map<String, dynamic> json) {
  return SubmitResponse(
    json['resCode'] as String,
    json['resMsg'] as String,
  );
}

Map<String, dynamic> _$SubmitResponseToJson(SubmitResponse instance) =>
    <String, dynamic>{
      'resCode': instance.resCode,
      'resMsg': instance.resMsg,
    };
