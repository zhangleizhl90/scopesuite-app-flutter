// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesResponse _$ResourcesResponseFromJson(Map<String, dynamic> json) {
  return ResourcesResponse(
    (json['resources'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResourcesResponseToJson(ResourcesResponse instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    sfid: json['sfid'] as String,
    path: json['path'] as String,
    icon: json['icon'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'sfid': instance.sfid,
      'path': instance.path,
      'icon': instance.icon,
      'label': instance.label,
    };
