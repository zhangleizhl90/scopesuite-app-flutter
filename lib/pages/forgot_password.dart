import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends BasePage {
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage> {
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: _buildForm(context)));
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        Logo(),
        ColumnSpace(35),
        BigTitle('FORGET', 'PASSWORD'),
        ColumnSpace(30),
        EmailInputField(controller: _emailController),
        ColumnSpace(15),
        InfoText('Please enter your username to start password recovery'),
        ColumnSpace(50),
        PrimaryButton('SEND', onPressed: () {
          _send(context);
        }),
        ColumnSpace(25),
        SecondaryButton('LOGIN', onPressed: () {
          _login(context);
        }),
      ],
    ));
  }

  TextEditingController _emailController = TextEditingController();

  void _send(BuildContext context) {
    final form = Form.of(context);
    if (form != null && form.validate()) {}
  }

  void _login(BuildContext context) {
    Navigator.pushNamed(context, '/Login');
  }
}
