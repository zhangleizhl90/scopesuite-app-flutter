
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person(this.id,
         this.surName,
         this.middleName,
         this.firstName,
         this.positionTitle,
         this.address,
         this.suburb,
         this.postcode,
         this.phoneNo,
         this.otherPhoneNo,
         this.state,
         this.mobileNo,
         this.comment,
         this.organisationId,
         this.enableSignOff,
         this.email);

  final int id;
  final String surName;
  final String firstName;
  final String middleName;
  final String positionTitle;
  final String address;
  final String suburb;
  final String postcode;
  final String phoneNo;
  final String state;
  final String otherPhoneNo;
  final String mobileNo;
  final String comment;
  final int organisationId;
  final bool enableSignOff;
  final String email;

  String get fullName => "$firstName $middleName $suburb".trim();

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}