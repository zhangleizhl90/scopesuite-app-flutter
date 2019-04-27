class ResourcesResponse {
  ResourcesResponse(this.resources);

  List<Resource> resources;

  factory ResourcesResponse.fromJson(Map<String, dynamic> json) {
    List<Resource> resources = <Resource>[];
    json['resources'].forEach((obj) {
      resources.add(Resource(
          sfid: obj['sfid'],
          path: obj['externalpath'],
          icon: obj['icon'],
          label: obj['label']));
    });
    return new ResourcesResponse(resources);
  }
}

class Resource {
  Resource({this.sfid, this.path, this.icon, this.label});

  final String sfid;
  final String path;
  final String icon;
  final String label;
}
