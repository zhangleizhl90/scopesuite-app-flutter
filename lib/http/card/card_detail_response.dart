import 'package:app/http/user/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_detail_response.g.dart';

@JsonSerializable()
class CardDetailResponse {

  CardDetailResponse(this.resCode, this.resMsg, this.card);

  @JsonKey()
  final String resCode;

  @JsonKey()
  final String resMsg;

  @JsonKey()
  final CardDetail card;

  factory CardDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CardDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailResponseToJson(this);
}

@JsonSerializable()
class CardDetail {

  CardDetail(this.id,
             this.certificate,
             this.cardVerificationStatusId,
             this.endDate,
             this.numDays,
             this.comment,
             this.learner,
             this.supervisor,
             this.fieldSupervisor,
             this.submissionDateTime,
             this.cardCompetencies,
             this.cardCoreCompetencies,
             this.cardRangeVariables);

  final int id;

  final Certificate certificate;

  final int cardVerificationStatusId;

  final String endDate;

  final int numDays;

  final String comment;

  final Person learner;

  final Person supervisor;

  final Person fieldSupervisor;

  final String submissionDateTime;

  final List<CardCompetency> cardCompetencies;

  final List<CardCoreCompetency> cardCoreCompetencies;

  final List<CardRangeVariable> cardRangeVariables;

  factory CardDetail.fromJson(Map<String, dynamic> json) =>
      _$CardDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailToJson(this);

}

@JsonSerializable()
class Certificate {

  Certificate(
    this.id,
    this.name,
    this.subName,
    this.clientName,
    this.clientShortName,
    this.teleformId,
    this.imageFilePath,
    this.siteNotice,
    this.displayRecognition,
    this.totalPoints,
    this.totalQuarters,
    this.x2coeff,
    this.xcoeff,
    this.activityTitle,
    this.roleTitle,
    this.exposureTitle,
    this.cardReceiptText,
    this.cardVerifyTextLearner,
    this.cardVerifyTextSupervisor,
    this.validNumDaysMax,
    this.supervisorVerified,
    this.learnerVerified
  );

  final int id;
  final String name;
  final String subName;
  final String clientName;
  final String clientShortName;
  final String teleformId;
  final String imageFilePath;
  final String siteNotice;
  final int displayRecognition;
  final int totalPoints;
  final int totalQuarters;
  final double x2coeff;
  final double xcoeff;
  final String activityTitle;
  final String roleTitle;
  final String exposureTitle;
  final String cardReceiptText;
  final String cardVerifyTextLearner;
  final String cardVerifyTextSupervisor;
  final String validNumDaysMax;
  final bool supervisorVerified;
  final bool learnerVerified;

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}

@JsonSerializable()
class CardCompetency {

  CardCompetency(
    this.id,
    this.cardId,
    this.competency,
    this.roleId,
    this.exposureId,
    this.learnerValue,
    this.exposureValue,
    this.tasks,
    this.exhibits,
    this.activities
  );

  final int id;
  final int cardId;
  final Competency competency;
  final int roleId;
  final int exposureId;
  final double learnerValue;
  final double exposureValue;
  final List<Task> tasks;
  final List<Exhibit> exhibits;
  final List<Activity> activities;

  factory CardCompetency.fromJson(Map<String, dynamic> json) =>
      _$CardCompetencyFromJson(json);

  Map<String, dynamic> toJson() => _$CardCompetencyToJson(this);
}

@JsonSerializable()
class Competency {

  Competency(
    this.id,
    this.no,
    this.name,
    this.groupId,
    this.target1,
    this.target2,
    this.target3,
    this.finalTarget,
    this.accelerant,
    this.certificateId,
    this.totalExposureModifier,
    this.totalExposureUnit,
    this.exposureReported
  );

  final int id;
  final int no;
  final String name;
  final int groupId;
  final int target1;
  final int target2;
  final int target3;
  final int finalTarget;
  final double accelerant;
  final int certificateId;
  final double totalExposureModifier;
  final String totalExposureUnit;
  final bool exposureReported;

  factory Competency.fromJson(Map<String, dynamic> json) =>
      _$CompetencyFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyToJson(this);
}

@JsonSerializable()
class CardCoreCompetency {

  CardCoreCompetency(
    this.id,
    this.cardId,
    this.coreCompetency,
    this.coreCompetencyRating
  );

  final int id;
  final int cardId;
  final CoreCompetency coreCompetency;
  final CoreCompetencyRating coreCompetencyRating;

  factory CardCoreCompetency.fromJson(Map<String, dynamic> json) =>
      _$CardCoreCompetencyFromJson(json);

  Map<String, dynamic> toJson() => _$CardCoreCompetencyToJson(this);
}

@JsonSerializable()
class CoreCompetency {

  CoreCompetency();

  factory CoreCompetency.fromJson(Map<String, dynamic> json) =>
      _$CoreCompetencyFromJson(json);

  Map<String, dynamic> toJson() => _$CoreCompetencyToJson(this);
}

@JsonSerializable()
class CoreCompetencyRating {

  CoreCompetencyRating(
    this.id,
    this.certificateId,
    this.no,
    this.text,
    this.value
  );

  final int id;
  final int certificateId;
  final int no;
  final String text;
  final int value;

  factory CoreCompetencyRating.fromJson(Map<String, dynamic> json) =>
      _$CoreCompetencyRatingFromJson(json);

  Map<String, dynamic> toJson() => _$CoreCompetencyRatingToJson(this);
}

@JsonSerializable()
class Task {

  Task(
    this.id,
    this.parentId,
    this.no,
    this.name,
    this.competencyId,
    this.completionStrategyId,
    this.competencyTypeId
  );

  final int id;
  final int parentId;
  final int no;
  final String name;
  final int competencyId;
  final int completionStrategyId;
  final int competencyTypeId;

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class Exhibit {

  Exhibit(
    this.id,
    this.learner,
    this.formatId,
    this.orderNo,
    this.caption,
    this.commment,
    this.storageId,
    this.storageReference,
    this.sasKey
  );

  final int id;
  final Person learner;
  final int formatId;
  final int orderNo;
  final String caption;
  final String commment;
  final int storageId;
  final String storageReference;
  final String sasKey;

  factory Exhibit.fromJson(Map<String, dynamic> json) =>
      _$ExhibitFromJson(json);

  Map<String, dynamic> toJson() => _$ExhibitToJson(this);
}

@JsonSerializable()
class CardRangeVariable {

  CardRangeVariable(this.id,
                    this.cardId,
                    this.rangeVariable,
                    this.rangeVariableRating);

  final int id;
  final int cardId;
  final RangeVariable rangeVariable;
  final RangeVariableRating rangeVariableRating;

  factory CardRangeVariable.fromJson(Map<String, dynamic> json) =>
      _$CardRangeVariableFromJson(json);

  Map<String, dynamic> toJson() => _$CardRangeVariableToJson(this);
}

@JsonSerializable()
class RangeVariable {

  RangeVariable(
    this.id,
    this.certificateId,
    this.groupId,
    this.no,
    this.text,
    this.value
  );

  final int id;
  final int certificateId;
  final int groupId;
  final int no;
  final String text;
  final String value;

  factory RangeVariable.fromJson(Map<String, dynamic> json) =>
      _$RangeVariableFromJson(json);

  Map<String, dynamic> toJson() => _$RangeVariableToJson(this);
}

@JsonSerializable()
class RangeVariableRating {

  RangeVariableRating(
    this.id,
    this.certificate,
    this.no,
    this.text,
    this.value
  );

  final int id;
  final int certificate;
  final int no;
  final String text;
  final String value;

  factory RangeVariableRating.fromJson(Map<String, dynamic> json) =>
      _$RangeVariableRatingFromJson(json);

  Map<String, dynamic> toJson() => _$RangeVariableRatingToJson(this);
}

@JsonSerializable()
class Activity {
  Activity(this.id, this.certificateId, this.no, this.name);

  final int id;
  final int certificateId;
  final int no;
  final String name;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}

/**
    {
    "resCode": "200",
    "resMsg": "Success",
    "card": {
    "updateAppUserId": 40194,
    "updateDateTime": "2019-05-14",
    "id": 1854755,
    "certificateId": 412,
    "certificate": {
    "updateAppUserId": 36698,
    "updateDateTime": "2019-06-04",
    "id": 412,
    "name": "TAFE Electrotech UEE30811 (SV) Electrician",
    "subName": "Cert III",
    "clientName": "TAFE NSW",
    "clientShortName": "TAFE",
    "teleformId": "01472",
    "imageFilePath": "image/l_skills-tracker.gif",
    "siteNotice": "",
    "displayRecognition": 1,
    "totalPoints": 0,
    "totalQuarters": 0,
    "x2coeff": 0.005,
    "xcoeff": 0.4,
    "activityTitle": "Activities",
    "roleTitle": "Roles",
    "exposureTitle": "Exposures",
    "cardReceiptText": "",
    "cardVerifyTextLearner": "",
    "cardVerifyTextSupervisor": "",
    "validNumDaysMax": "7",
    "supervisorVerified": true,
    "learnerVerified": true
    },
    "cardVerificationStatusId": 2,
    "endDate": "2019-05-12",
    "numDays": 1,
    "comment": "",
    "learnerId": 39549,
    "supervisorId": 43753,
    "fieldSupervisorId": 43752,
    "submissionDateTime": "2019-05-14",
    "cardCompetencies": [
    {
    "updateAppUserId": 40194,
    "updateDateTime": "2019-05-14",
    "id": null,
    "cardId": 1854755,
    "competencyId": 9644,
    "competency": {
    "updateAppUserId": 36698,
    "updateDateTime": "2019-03-04",
    "id": 9644,
    "no": 4,
    "name": "Solve problems in electromagnetic circuits (G101A)",
    "groupId": 1382,
    "target1": 0,
    "target2": 0,
    "target3": 0,
    "finalTarget": 4,
    "accelerant": 1.0,
    "certificateId": 412,
    "totalExposureModifier": 0.0,
    "totalExposureUnit": "hours",
    "exposureReported": false
    },
    "roleId": 1306,
    "exposureId": 1540,
    "learningValue": 0.308,
    "exposureValue": 1.0,
    "tasks": [],
    "exhibits": [],
    "activities": [
    {
    "updateAppUserId": 40194,
    "updateDateTime": "2019-05-14",
    "id": 1280,
    "certificateId": 412,
    "certificate": null,
    "no": 4,
    "name": "Carried out testing"
    }
    ]
    }
    ],
    "cardCoreCompetencies": [
    {
    "updateAppUserId": 40194,
    "updateDateTime": "2019-05-14",
    "id": 5076612,
    "cardId": 1854755,
    "coreCompetencyId": 5228,
    "coreCompetency": {
    "updateAppUserId": 11116,
    "updateDateTime": "2018-04-10",
    "id": 5228,
    "no": 1,
    "name": "Participate in elec work & competency dev't activities (C020B)",
    "groupId": null,
    "target1": null,
    "target2": null,
    "target3": null,
    "finalTarget": null,
    "accelerant": null,
    "certificateId": 412,
    "totalExposureModifier": null,
    "totalExposureUnit": null,
    "exposureReported": null
    },
    "coreCompetencyRatingId": 1826,
    "coreCompetencyRating": {
    "updateAppUserId": 7,
    "updateDateTime": "2014-04-24",
    "id": 1826,
    "certificateId": 412,
    "certificate": null,
    "no": 1,
    "text": "< 4 hrs",
    "value": 1
    }
    }
    ],
    "cardRangeVariables": [
    {
    "updateAppUserId": 40194,
    "updateDateTime": "2019-05-14",
    "id": 21879088,
    "cardId": 1854755,
    "card": null,
    "rangeVariableId": 11148,
    "rangeVariable": {
    "updateAppUserId": 11116,
    "updateDateTime": "2017-01-30",
    "id": 11148,
    "groupId": 1192,
    "group": null,
    "no": 1,
    "name": "Aerial (eg.posts, poles, struts)",
    "certificateId": 412,
    "certificate": null
    },
    "rangeVariableRatingId": 1928,
    "rangeVariableRating": {
    "updateAppUserId": 7,
    "updateDateTime": "2014-04-24",
    "id": 1928,
    "certificateId": 412,
    "certificate": null,
    "no": null,
    "text": null,
    "value": null
    }
    }
    ],
    "verifiedByLearner": true,
    "verifiedByFieldSupervisor": false,
    "verifiedBySupervisor": true
    }
    }
**/