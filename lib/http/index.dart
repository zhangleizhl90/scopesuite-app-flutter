export 'package:app/http/login_response.dart';
export 'package:app/http/resource_response.dart';

import 'package:app/http/login_response.dart';
import 'package:app/http/resource_response.dart';
import 'package:app/utils.dart';
import 'package:dio/dio.dart';

const URL_BASE = "http://192.168.31.220:3000";

const URL_LOGIN = "$URL_BASE/users/sign_in.json";

const URL_RESOURCES = "$URL_BASE/api/v2/resources";

Future<LoginResponse> login(String username, String password) async {
  Dio dio = new Dio();
  FormData formData = new FormData.from({
    "user[email]": username,
    "user[password]": password
  });
  Response response = await dio.post(URL_LOGIN, data: formData);
  return LoginResponse.fromJson(response.data);
  // {"error": "Invalid Email or password"}
  // {"id": 2, "authentication_token": "xxx", "created_at": "", "updated_at": ""}
}

Future<ResourcesResponse> getResources() async {
  Dio dio = new Dio();
  String authToken = await getLoginToken();
  Response response = await dio.get(URL_RESOURCES, queryParameters: {"auth_token": authToken});
  return ResourcesResponse.fromJson(response.data);
}