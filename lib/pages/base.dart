import 'package:flutter/material.dart';
import 'package:app/colors.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(image: _bgImage()),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: buildAppBar(context),
            body: buildBody(context)));
  }

  Widget buildBody(BuildContext context);

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(buildTitle(), style: TextStyle(color: AppColors.white)),
        actions: buildActions(context),
        centerTitle: true,
        elevation: 0);
  }

  String buildTitle() {
    return '';
  }

  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }

  DecorationImage _bgImage() {
    return DecorationImage(
        image: AssetImage("images/bg.png"), fit: BoxFit.cover);
  }
}
