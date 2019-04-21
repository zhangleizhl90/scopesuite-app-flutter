import 'package:flutter/material.dart';

void showAlert(BuildContext context, String alert) {
  showDialog(context: context, builder: (_) => AlertDialog(
    title: Text(alert),
  ));
}