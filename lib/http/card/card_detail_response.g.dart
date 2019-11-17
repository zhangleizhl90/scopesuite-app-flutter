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
    json['learner'] == null
        ? null
        : Person.fromJson(json['learner'] as Map<String, dynamic>),
    json['supervisor'] == null
        ? null
        : Person.fromJson(json['supervisor'] as Map<String, dynamic>),
    json['fieldSupervisor'] == null
        ? null
        : Person.fromJson(json['fieldSupervisor'] as Map<String, dynamic>),
    json['submissionDateTime'] as String,
    (json['cardCompetencies'] as List)
        ?.map((e) => e == null
            ? null
            : CardCompetency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['cardCoreCompetencies'] as List)
        ?.map((e) => e == null
            ? null
            : CardCoreCompetency.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['cardRangeVariables'] as List)
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
      'learner': instance.learner,
      'supervisor': instance.supervisor,
      'fieldSupervisor': instance.fieldSupervisor,
      'submissionDateTime': instance.submissionDateTime,
      'cardCompetencies': instance.cardCompetencies,
      'cardCoreCompetencies': instance.cardCoreCompetencies,
      'cardRangeVariables': instance.cardRangeVariables,
    };

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    json['id'] as int,
    json['name'] as String,
    json['subName'] as String,
    json['clientName'] as String,
    json['clientShortName'] as String,
    json['teleformId'] as String,
    json['imageFilePath'] as String,
    json['siteNotice'] as String,
    json['displayRecognition'] as int,
    json['totalPoints'] as int,
    json['totalQuarters'] as int,
    (json['x2coeff'] as num)?.toDouble(),
    (json['xcoeff'] as num)?.toDouble(),
    json['activityTitle'] as String,
    json['roleTitle'] as String,
    json['exposureTitle'] as String,
    json['cardReceiptText'] as String,
    json['cardVerifyTextLearner'] as String,
    json['cardVerifyTextSupervisor'] as String,
    json['validNumDaysMax'] as String,
    json['supervisorVerified'] as bool,
    json['learnerVerified'] as bool,
  );
}

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subName': instance.subName,
      'clientName': instance.clientName,
      'clientShortName': instance.clientShortName,
      'teleformId': instance.teleformId,
      'imageFilePath': instance.imageFilePath,
      'siteNotice': instance.siteNotice,
      'displayRecognition': instance.displayRecognition,
      'totalPoints': instance.totalPoints,
      'totalQuarters': instance.totalQuarters,
      'x2coeff': instance.x2coeff,
      'xcoeff': instance.xcoeff,
      'activityTitle': instance.activityTitle,
      'roleTitle': instance.roleTitle,
      'exposureTitle': instance.exposureTitle,
      'cardReceiptText': instance.cardReceiptText,
      'cardVerifyTextLearner': instance.cardVerifyTextLearner,
      'cardVerifyTextSupervisor': instance.cardVerifyTextSupervisor,
      'validNumDaysMax': instance.validNumDaysMax,
      'supervisorVerified': instance.supervisorVerified,
      'learnerVerified': instance.learnerVerified,
    };

CardCompetency _$CardCompetencyFromJson(Map<String, dynamic> json) {
  return CardCompetency(
    json['id'] as int,
    json['cardId'] as int,
    json['competency'] == null
        ? null
        : Competency.fromJson(json['competency'] as Map<String, dynamic>),
    json['roleId'] as int,
    json['exposureId'] as int,
    (json['learnerValue'] as num)?.toDouble(),
    (json['exposureValue'] as num)?.toDouble(),
    (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['exhibits'] as List)
        ?.map((e) =>
            e == null ? null : Exhibit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['activities'] as List)
        ?.map((e) =>
            e == null ? null : Activity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardCompetencyToJson(CardCompetency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': instance.cardId,
      'competency': instance.competency,
      'roleId': instance.roleId,
      'exposureId': instance.exposureId,
      'learnerValue': instance.learnerValue,
      'exposureValue': instance.exposureValue,
      'tasks': instance.tasks,
      'exhibits': instance.exhibits,
      'activities': instance.activities,
    };

Competency _$CompetencyFromJson(Map<String, dynamic> json) {
  return Competency(
    json['id'] as int,
    json['no'] as int,
    json['name'] as String,
    json['groupId'] as int,
    json['target1'] as int,
    json['target2'] as int,
    json['target3'] as int,
    json['finalTarget'] as int,
    (json['accelerant'] as num)?.toDouble(),
    json['certificateId'] as int,
    (json['totalExposureModifier'] as num)?.toDouble(),
    json['totalExposureUnit'] as String,
    json['exposureReported'] as bool,
  );
}

Map<String, dynamic> _$CompetencyToJson(Competency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'name': instance.name,
      'groupId': instance.groupId,
      'target1': instance.target1,
      'target2': instance.target2,
      'target3': instance.target3,
      'finalTarget': instance.finalTarget,
      'accelerant': instance.accelerant,
      'certificateId': instance.certificateId,
      'totalExposureModifier': instance.totalExposureModifier,
      'totalExposureUnit': instance.totalExposureUnit,
      'exposureReported': instance.exposureReported,
    };

CardCoreCompetency _$CardCoreCompetencyFromJson(Map<String, dynamic> json) {
  return CardCoreCompetency(
    json['id'] as int,
    json['cardId'] as int,
    json['coreCompetency'] == null
        ? null
        : CoreCompetency.fromJson(
            json['coreCompetency'] as Map<String, dynamic>),
    json['coreCompetencyRating'] == null
        ? null
        : CoreCompetencyRating.fromJson(
            json['coreCompetencyRating'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CardCoreCompetencyToJson(CardCoreCompetency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': instance.cardId,
      'coreCompetency': instance.coreCompetency,
      'coreCompetencyRating': instance.coreCompetencyRating,
    };

CoreCompetency _$CoreCompetencyFromJson(Map<String, dynamic> json) {
  return CoreCompetency();
}

Map<String, dynamic> _$CoreCompetencyToJson(CoreCompetency instance) =>
    <String, dynamic>{};

CoreCompetencyRating _$CoreCompetencyRatingFromJson(Map<String, dynamic> json) {
  return CoreCompetencyRating(
    json['id'] as int,
    json['certificateId'] as int,
    json['no'] as int,
    json['text'] as String,
    json['value'] as int,
  );
}

Map<String, dynamic> _$CoreCompetencyRatingToJson(
        CoreCompetencyRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'certificateId': instance.certificateId,
      'no': instance.no,
      'text': instance.text,
      'value': instance.value,
    };

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    json['id'] as int,
    json['parentId'] as int,
    json['no'] as int,
    json['name'] as String,
    json['competencyId'] as int,
    json['completionStrategyId'] as int,
    json['competencyTypeId'] as int,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'no': instance.no,
      'name': instance.name,
      'competencyId': instance.competencyId,
      'completionStrategyId': instance.completionStrategyId,
      'competencyTypeId': instance.competencyTypeId,
    };

Exhibit _$ExhibitFromJson(Map<String, dynamic> json) {
  return Exhibit(
    json['id'] as int,
    json['learner'] == null
        ? null
        : Person.fromJson(json['learner'] as Map<String, dynamic>),
    json['formatId'] as int,
    json['orderNo'] as int,
    json['caption'] as String,
    json['commment'] as String,
    json['storageId'] as int,
    json['storageReference'] as String,
    json['sasKey'] as String,
  );
}

Map<String, dynamic> _$ExhibitToJson(Exhibit instance) => <String, dynamic>{
      'id': instance.id,
      'learner': instance.learner,
      'formatId': instance.formatId,
      'orderNo': instance.orderNo,
      'caption': instance.caption,
      'commment': instance.commment,
      'storageId': instance.storageId,
      'storageReference': instance.storageReference,
      'sasKey': instance.sasKey,
    };

CardRangeVariable _$CardRangeVariableFromJson(Map<String, dynamic> json) {
  return CardRangeVariable(
    json['id'] as int,
    json['cardId'] as int,
    json['rangeVariable'] == null
        ? null
        : RangeVariable.fromJson(json['rangeVariable'] as Map<String, dynamic>),
    json['rangeVariableRating'] == null
        ? null
        : RangeVariableRating.fromJson(
            json['rangeVariableRating'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CardRangeVariableToJson(CardRangeVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': instance.cardId,
      'rangeVariable': instance.rangeVariable,
      'rangeVariableRating': instance.rangeVariableRating,
    };

RangeVariable _$RangeVariableFromJson(Map<String, dynamic> json) {
  return RangeVariable(
    json['id'] as int,
    json['certificateId'] as int,
    json['groupId'] as int,
    json['no'] as int,
    json['text'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$RangeVariableToJson(RangeVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'certificateId': instance.certificateId,
      'groupId': instance.groupId,
      'no': instance.no,
      'text': instance.text,
      'value': instance.value,
    };

RangeVariableRating _$RangeVariableRatingFromJson(Map<String, dynamic> json) {
  return RangeVariableRating(
    json['id'] as int,
    json['certificate'] as int,
    json['no'] as int,
    json['text'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$RangeVariableRatingToJson(
        RangeVariableRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'certificate': instance.certificate,
      'no': instance.no,
      'text': instance.text,
      'value': instance.value,
    };

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
