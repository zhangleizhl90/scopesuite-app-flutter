import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends BasePage {
  ChangePasswordPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends BasePageState<ChangePasswordPage> {
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: _buildForm(context)));
  }

  Form _buildForm(BuildContext context) {
    return Form(
        child: Column(
          children: <Widget>[
            Logo(),
            ColumnSpace(35),
            BigTitle('CHANGE', 'PASSWORD'),
            ColumnSpace(30),
            PasswordInputField(
                hintText: 'New Password', controller: _passwordController),
            ColumnSpace(25),
            PasswordInputField(
                hintText: 'Confirm New Password',
                controller: _confirmPasswordController),
            ColumnSpace(25),
            PrimaryButton('CHANGE PASSWORD', onPressed: () {
              _changePassword(context);
            }),
            ColumnSpace(25),
            SecondaryButton('LOGIN', onPressed: () {
              _login(context);
            }),
          ],
        ));
  }

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _changePassword(BuildContext context) {
    final form = Form.of(context);
    if (form != null && form.validate()) {}
  }

  void _login(BuildContext context) {
    Navigator.pushNamed(context, '/Login');
  }
}
