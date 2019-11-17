import 'package:app/http/user/person.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_list_response.g.dart';

@JsonSerializable()
class CardListResponse {

  CardListResponse(this.resCode, this.resMsg, this.cards);

  @JsonKey()
  final String resCode;

  @JsonKey()
  final String resMsg;

  @JsonKey()
  final List<CardItem> cards;


  factory CardListResponse.fromJson(Map<String, dynamic> json) =>
      _$CardListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CardListResponseToJson(this);
}

@JsonSerializable()
class CardItem {

  CardItem(this.id,
      this.cardVerificationStatusId,
      this.certificateId,
      this.submissionDateTime,
      this.endDate,
      this.numDays,
      this.comment,
      this.learner,
      this.supervisor,
      this.fieldSupervisor,
      this.verifiedByLearner,
      this.verifiedBySupervisor,
      this.verifiedByFieldSupervisor);

  final int id;
  final int certificateId;
  final int cardVerificationStatusId;
  final String submissionDateTime;
  final String endDate;
  final int numDays;
  final String comment;
  final Person learner;
  final Person supervisor;
  final Person fieldSupervisor;
  final bool verifiedBySupervisor;
  final bool verifiedByLearner;
  final bool verifiedByFieldSupervisor;

  factory CardItem.fromJson(Map<String, dynamic> json) =>
      _$CardItemFromJson(json);

  Map<String, dynamic> toJson() => _$CardItemToJson(this);
}