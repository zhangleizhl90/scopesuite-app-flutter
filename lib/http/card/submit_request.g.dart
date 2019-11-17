// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitRequest _$SubmitRequestFromJson(Map<String, dynamic> json) {
  return SubmitRequest(
    json['cardId'] as int,
    json['isVerified'] as bool,
    json['comment'] as String,
  );
}

Map<String, dynamic> _$SubmitRequestToJson(SubmitRequest instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'isVerified': instance.isVerified,
      'comment': instance.comment,
    };
