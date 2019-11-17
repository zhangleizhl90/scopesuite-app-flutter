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
             this.learnerId,
             this.supervisorId,
             this.fieldSupervisorId,
             this.submissionDateTime,
             this.competencies,
             this.coreCompetencies,
             this.rangeVariables);

  final int id;

  final Certificate certificate;

  final int cardVerificationStatusId;

  final String endDate;

  final int numDays;

  final String comment;

  final int learnerId;

  final int supervisorId;

  final int fieldSupervisorId;

  final String submissionDateTime;

  final List<Competency> competencies;

  final List<CoreCompetency> coreCompetencies;

  final List<CardRangeVariable> rangeVariables;

  factory CardDetail.fromJson(Map<String, dynamic> json) =>
      _$CardDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailToJson(this);

}

@JsonSerializable()
class Certificate {

  Certificate();

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);

  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}

@JsonSerializable()
class Competency {

  Competency();

  factory Competency.fromJson(Map<String, dynamic> json) =>
      _$CompetencyFromJson(json);

  Map<String, dynamic> toJson() => _$CompetencyToJson(this);
}

@JsonSerializable()
class CoreCompetency {

  CoreCompetency();

  factory CoreCompetency.fromJson(Map<String, dynamic> json) =>
      _$CoreCompetencyFromJson(json);

  Map<String, dynamic> toJson() => _$CoreCompetencyToJson(this);
}

@JsonSerializable()
class Task {

  Task();

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class Exhibit {

  Exhibit();

  factory Exhibit.fromJson(Map<String, dynamic> json) =>
      _$ExhibitFromJson(json);

  Map<String, dynamic> toJson() => _$ExhibitToJson(this);
}

@JsonSerializable()
class Rating {
  
  Rating();
  
  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class CardRangeVariable {

  CardRangeVariable(this.id,
                    this.cardId,
                    this.rangeVariable);

  @JsonKey()
  final int id;

  @JsonKey()
  final int cardId;

  @JsonKey()
  final RangeVariable rangeVariable;

  factory CardRangeVariable.fromJson(Map<String, dynamic> json) =>
      _$CardRangeVariableFromJson(json);

  Map<String, dynamic> toJson() => _$CardRangeVariableToJson(this);
}

@JsonSerializable()
class RangeVariable {

  RangeVariable();

  factory RangeVariable.fromJson(Map<String, dynamic> json) =>
      _$RangeVariableFromJson(json);

  Map<String, dynamic> toJson() => _$RangeVariableToJson(this);
}

@JsonSerializable()
class Activity {
  Activity(this.id, this.certificateId, this.no, this.name);

  @JsonKey()
  final int id;

  @JsonKey()
  final int certificateId;

  @JsonKey()
  final int no;

  @JsonKey()
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