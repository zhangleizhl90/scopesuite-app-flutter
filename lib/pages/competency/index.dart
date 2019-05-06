import 'package:app/pages/base.dart';
import 'package:flutter/material.dart';

class CompetencyPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _CompetencyPageState();

}

class _CompetencyPageState extends BasePageState<CompetencyPage> {
  @override
  Widget buildBody(BuildContext context) {
    return Container(
      child: Text("Competency"),
    );
  }

}