export 'package:app/http/login/login_response.dart';
export 'package:app/http/login/resource_response.dart';

import 'package:app/http/login/login_response.dart';
import 'package:app/http/login/resource_response.dart';
import 'package:app/utils.dart';

const URL_BASE = "http://192.168.31.68:3000";

const URL_LOGIN = "$URL_BASE/users/sign_in.json/";
const URL_RESOURCES = "$URL_BASE/api/v2/resources/";
const URL_PROFILE = "$URL_BASE/api/v2/contacts/";
const URL_DASHBOARD = "$URL_BASE/api/v2/dashboards/";

Future<Map> _get<T>(String url) async {
  // Dio dio = new Dio();
  // String authToken = await getLoginToken();
  // Response<Map> response =
  //     await dio.get(url, queryParameters: {"auth_token": authToken});
  // return response.data;
}

Future<LoginResponse> login(String username, String password) async {
  // Dio dio = new Dio();
  // FormData formData =
  //     new FormData.from({"user[email]": username, "user[password]": password});
  // Response response = await dio.post(URL_LOGIN, data: formData);
  // return LoginResponse.fromJson(response.data);
  // // {"error": "Invalid Email or password"}
  // // {"id": 2, "authentication_token": "xxx", "created_at": "", "updated_at": ""}
}

Future<ResourcesResponse> getResources() async {
  var userId = await getUserId();
  return ResourcesResponse.fromJson(await _get("$URL_RESOURCES$userId/"));
}

Future<ProfileResponse> getProfile() async {
  var userId = await getUserId();
  return ProfileResponse.fromJson(await _get("$URL_PROFILE$userId/"));
}

Future<DashboardResponse> getDashboard() async {
  var userId = await getUserId();
  return DashboardResponse.fromJson(await _get("$URL_DASHBOARD$userId/"));
}

class DashboardResponse {
  DashboardResponse(
      {this.currentScore,
      this.currentScoreLabel,
      this.historicalScores,
      this.historyScoreLabel});

  final int currentScore;
  final String currentScoreLabel;
  final String historyScoreLabel;
  final HistoricalScore historicalScores;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
        currentScore: json["current_score"],
        currentScoreLabel: json["current_score_label"],
        historyScoreLabel: json["historical_score_label"],
        historicalScores: HistoricalScore.fromJson(json["historical_scores"]));
  }
}

class HistoricalScore {
  HistoricalScore({this.keys, this.lists, this.colors});

  List keys;
  List lists;
  Map colors;

  factory HistoricalScore.fromJson(Map<String, dynamic> json) {
    return HistoricalScore(
        keys: json["keys"], lists: json["lists"], colors: json["colors"]);
  }
}

class ProfileResponse {
  ProfileResponse(
      {this.isLearner,
      this.avatar,
      this.username,
      this.qualification,
      this.city,
      this.country,
      this.siteUrl,
      this.phone,
      this.mobile,
      this.email,
      this.sections});

  bool isLearner;
  String avatar;
  String username;
  String qualification;
  String city;
  String country;
  String siteUrl;
  String email;
  String phone;
  String mobile;
  List<Section> sections;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
        isLearner: json['is_learner'],
        avatar: json['avatar'],
        username: json['username'],
        qualification: json['qualification'],
        city: json['city'],
        country: json['country'],
        siteUrl: json['site_address_url'],
        email: json['email'],
        phone: json['phone'],
        mobile: json['mobile'],
        sections: Section.fromJsonArray(json['sections']));
  }
}

class Section {
  Section({this.header, this.fields});

  String header;
  List<Field> fields;

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
        header: json['header'], fields: Field.fromJsonArray(json['fields']));
  }

  static List<Section> fromJsonArray(List<dynamic> jsonArray) {
    return List<Section>.generate(jsonArray.length, (int i) {
      return Section.fromJson(jsonArray[i]);
    });
  }
}

class Field {
  Field({this.label, this.value});

  String label;
  String value;

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(label: json['label'], value: json['value']);
  }

  static fromJsonArray(List<dynamic> jsonArray) {
    return List<Field>.generate(jsonArray.length, (int i) {
      return Field.fromJson(jsonArray[i]);
    });
  }
}
