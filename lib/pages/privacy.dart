import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/widgets.dart';

class PrivacyPolicyPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends BasePageState<PrivacyPolicyPage> {
  @override
  Widget buildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
        child: Column(
          children: <Widget>[
            BigTitle("PRICACY POLICY"),
          ],
        ));
  }
}
