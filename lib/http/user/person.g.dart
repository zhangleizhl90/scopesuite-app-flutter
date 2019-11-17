// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    json['id'] as int,
    json['surName'] as String,
    json['middleName'] as String,
    json['firstName'] as String,
    json['positionTitle'] as String,
    json['address'] as String,
    json['suburb'] as String,
    json['postcode'] as String,
    json['phoneNo'] as String,
    json['otherPhoneNo'] as String,
    json['state'] as String,
    json['mobileNo'] as String,
    json['comment'] as String,
    json['organisationId'] as int,
    json['enableSignOff'] as bool,
    json['email'] as String,
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'surName': instance.surName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'positionTitle': instance.positionTitle,
      'address': instance.address,
      'suburb': instance.suburb,
      'postcode': instance.postcode,
      'phoneNo': instance.phoneNo,
      'state': instance.state,
      'otherPhoneNo': instance.otherPhoneNo,
      'mobileNo': instance.mobileNo,
      'comment': instance.comment,
      'organisationId': instance.organisationId,
      'enableSignOff': instance.enableSignOff,
      'email': instance.email,
    };
