// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardListResponse _$CardListResponseFromJson(Map<String, dynamic> json) {
  return CardListResponse(
    json['resCode'] as String,
    json['resMsg'] as String,
    (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardListResponseToJson(CardListResponse instance) =>
    <String, dynamic>{
      'resCode': instance.resCode,
      'resMsg': instance.resMsg,
      'cards': instance.cards,
    };

CardItem _$CardItemFromJson(Map<String, dynamic> json) {
  return CardItem(
    json['id'] as int,
    json['cardVerificationStatusId'] as int,
    json['certificateId'] as int,
    json['submissionDateTime'] as String,
    json['endDate'] as String,
    json['numDays'] as int,
    json['comment'] as String,
    json['learner'] == null
        ? null
        : Person.fromJson(json['learner'] as Map<String, dynamic>),
    json['supervisor'] == null
        ? null
        : Person.fromJson(json['supervisor'] as Map<String, dynamic>),
    json['fieldSupervisor'] == null
        ? null
        : Person.fromJson(json['fieldSupervisor'] as Map<String, dynamic>),
    json['verifiedByLearner'] as bool,
    json['verifiedBySupervisor'] as bool,
    json['verifiedByFieldSupervisor'] as bool,
  );
}

Map<String, dynamic> _$CardItemToJson(CardItem instance) => <String, dynamic>{
      'id': instance.id,
      'certificateId': instance.certificateId,
      'cardVerificationStatusId': instance.cardVerificationStatusId,
      'submissionDateTime': instance.submissionDateTime,
      'endDate': instance.endDate,
      'numDays': instance.numDays,
      'comment': instance.comment,
      'learner': instance.learner,
      'supervisor': instance.supervisor,
      'fieldSupervisor': instance.fieldSupervisor,
      'verifiedBySupervisor': instance.verifiedBySupervisor,
      'verifiedByLearner': instance.verifiedByLearner,
      'verifiedByFieldSupervisor': instance.verifiedByFieldSupervisor,
    };
