export 'package:app/http/login/login_response.dart';
export 'package:app/http/login/resource_response.dart';

import 'dart:io';

import 'package:app/http/login/login_request.dart';
import 'package:app/http/login/login_response.dart';
import 'package:app/utils.dart';
import 'package:dio/dio.dart';

import '../exception.dart';
import 'card/card_detail_response.dart';
import 'card/card_list_response.dart';
import 'card/submit_request.dart';
import 'card/submit_response.dart';

//const URL_BASE = "http://192.168.31.68:3000";
const HOST = "http://192.168.31.24:8080";

//const URL_LOGIN = "$URL_BASE/auth/login";
//const URL_RESOURCES = "$URL_BASE/api/v2/resources";
//const URL_PROFILE = "$URL_BASE/api/v2/contacts";
//const URL_DASHBOARD = "$URL_BASE/api/v2/dashboards";

final authInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options) async {
    if (options.path.startsWith('/auth')) {
      return options;
    }

    final authToken = await getLoginToken();
    options.headers['Authorization'] = "Bearer $authToken";
    return options;
  }
);

Future<Map> _get<T>(String path, {Map<String, dynamic> queryParams}) async {
  final dio = Dio(BaseOptions(baseUrl: HOST));
  dio.interceptors.add(authInterceptor);
  Response response;
  try {
    response = await dio.get(path, queryParameters: queryParams, 
    options: Options(
        headers: {
          Headers.acceptHeader: Headers.jsonContentType,
          Headers.contentTypeHeader: Headers.jsonContentType
        }
    ));
  } catch(err) {
    throw new Exception('Failed to request data');
  }

  if (response.statusCode == HttpStatus.ok) {
    return response.data;
  } else if (response.statusCode == HttpStatus.unauthorized) {
    throw new UnauthorizedException();
  } else {
    throw new Exception('Failed to request data');
  }
}

Future<Map> _post<T>(String path, Map<String, dynamic> data) async {
  final dio = Dio(BaseOptions(baseUrl: HOST));
  dio.interceptors.add(authInterceptor);
  final response = await dio.post(path, data: data, options: Options(
    headers: {
      Headers.acceptHeader: Headers.jsonContentType,
      Headers.contentTypeHeader: Headers.jsonContentType
    }
  ));
  if (response.statusCode == HttpStatus.ok) {
    return response.data;
  } else if (response.statusCode == HttpStatus.unauthorized) {
    throw new UnauthorizedException();
  } else {
    throw new Exception("Failed to request data");
  }
}

Future<LoginResponse> login(String username, String password) async {
  final loginRequest = LoginRequest(username, password);
  final loginResponseJson = await _post('/auth/login', loginRequest.toJson());
  return LoginResponse.fromJson(loginResponseJson);
}

Future<CardListResponse> getCardList() async {
  final json = await _get('/card-list');
  return CardListResponse.fromJson(json);
}

Future<CardDetailResponse> getCardDetail(int cardId) async {
  final json = await _get("/card/$cardId");
  return CardDetailResponse.fromJson(json);
}

Future<SubmitResponse> submitCard(int cardId, bool isVerified, String comment) async {
  final request = SubmitRequest(cardId, isVerified, comment);
  final json = await _post('/card/submit', request.toJson());
  return SubmitResponse.fromJson(json);
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
