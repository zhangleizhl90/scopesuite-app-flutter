// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetailResponse _$CardDetailResponseFromJson(Map<String, dynamic> json) {
  return CardDetailResponse(
    json['resCode'] as String,
    json['resMsg'] as String,
    json['card'] == null
        ? null
        : CardDetail.fromJson(json['card'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CardDetailResponseToJson(CardDetailResponse instance) =>
    <String, dynamic>{
      'resCode': instance.resCode,
      'resMsg': instance.resMsg,
      'card': instance.card,
    };

CardDetail _$CardDetailFromJson(Map<String, dynamic> json) {
  return CardDetail(
    json['id'] as int,
    json['certificate'] == null
        ? null
        : Certificate.fromJson(json['certificate'] as Map<String, dynamic>),
    json['cardVerificationStatusId'] as int,
    json['endDate'] as String,
    json['numDays'] as int,
    json['comment'] as String,
    json['learnerId'] as int,
    json['supervisorId'] as int,
    json['fieldSupervisorId'] as int,
    json['submissionDateTime'] as String,
    (json['competencies'] as List)
        ?.map((e) =>
            e == null ? null : Competency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['coreCompetencies'] as List)
        ?.map((e) => e == null
            ? null
            : CoreCompetency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['rangeVariables'] as List)
        ?.map((e) => e == null
            ? null
            : CardRangeVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardDetailToJson(CardDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'certificate': instance.certificate,
      'cardVerificationStatusId': instance.cardVerificationStatusId,
      'endDate': instance.endDate,
      'numDays': instance.numDays,
      'comment': instance.comment,
      'learnerId': instance.learnerId,
      'supervisorId': instance.supervisorId,
      'fieldSupervisorId': instance.fieldSupervisorId,
      'submissionDateTime': instance.submissionDateTime,
      'competencies': instance.competencies,
      'coreCompetencies': instance.coreCompetencies,
      'rangeVariables': instance.rangeVariables,
    };

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate();
}

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{};

Competency _$CompetencyFromJson(Map<String, dynamic> json) {
  return Competency();
}

Map<String, dynamic> _$CompetencyToJson(Competency instance) =>
    <String, dynamic>{};

CoreCompetency _$CoreCompetencyFromJson(Map<String, dynamic> json) {
  return CoreCompetency();
}

Map<String, dynamic> _$CoreCompetencyToJson(CoreCompetency instance) =>
    <String, dynamic>{};

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task();
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{};

Exhibit _$ExhibitFromJson(Map<String, dynamic> json) {
  return Exhibit();
}

Map<String, dynamic> _$ExhibitToJson(Exhibit instance) => <String, dynamic>{};

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating();
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{};

CardRangeVariable _$CardRangeVariableFromJson(Map<String, dynamic> json) {
  return CardRangeVariable(
    json['id'] as int,
    json['cardId'] as int,
    json['rangeVariable'] == null
        ? null
        : RangeVariable.fromJson(json['rangeVariable'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CardRangeVariableToJson(CardRangeVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': instance.cardId,
      'rangeVariable': instance.rangeVariable,
    };

RangeVariable _$RangeVariableFromJson(Map<String, dynamic> json) {
  return RangeVariable();
}

Map<String, dynamic> _$RangeVariableToJson(RangeVariable instance) =>
    <String, dynamic>{};

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    json['id'] as int,
    json['certificateId'] as int,
    json['no'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'certificateId': instance.certificateId,
      'no': instance.no,
      'name': instance.name,
    };
