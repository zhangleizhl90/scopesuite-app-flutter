import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showAlert(BuildContext context, String alert) {
  showDialog(context: context, builder: (_) => AlertDialog(
    title: Text(alert),
  ));
}

Future<bool> isLogined() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String authToken = prefs.getString("authToken");
  return authToken != null && authToken.isNotEmpty;
}

Future<String> getLoginToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("authToken");
}

Future<int> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt("userId");
}

Future<void> saveLoginToken(String token, int userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("authToken", token);
  prefs.setInt("userId", userId);
}

Future<void> removeLoginToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("authToken");
  prefs.remove("userId");
}