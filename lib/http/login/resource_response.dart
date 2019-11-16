import 'package:json_annotation/json_annotation.dart';

part 'resource_response.g.dart';

@JsonSerializable()
class ResourcesResponse {
  ResourcesResponse(this.resCode, this.resMsg, this.resources);

  @JsonKey()
  final String resCode;

  @JsonKey()
  final String resMsg;

  @JsonKey()
  List<Resource> resources;

  factory ResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ResourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesResponseToJson(this);
}

@JsonSerializable()
class Resource {
  Resource({this.sfid, this.path, this.icon, this.label});

  final String sfid;
  final String path;
  final String icon;
  final String label;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
