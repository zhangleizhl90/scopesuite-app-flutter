import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class LoginPage extends BasePage {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: Form(
                child: Column(children: <Widget>[
              Logo(),
              ColumnSpace(35),
              BigTitle('MEMBER', 'LOGIN'),
              ColumnSpace(30),
              EmailInputField(controller: _emailController),
              ColumnSpace(25),
              PasswordInputField(controller: _passwordController),
              ColumnSpace(25),
              PrimaryButton('LOGIN', onPressed: () {
                _login(context);
              }),
              ColumnSpace(25),
              SecondaryButton('CLAIM ACCOUNT', onPressed: () {
                _claimAccount(context);
              }),
              ColumnSpace(30),
              TextButton('Forgot Your Password?', onPressed: () {
                _forgotPassword(context);
              })
            ]))));
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    final form = Form.of(context);
    if (form != null && form.validate()) {
      showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                  title: new Text("Dialog Title"),
                  content: new Text(_emailController.toString()),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("CANCEL"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ]));
    }
  }

  void _claimAccount(BuildContext context) {
    Navigator.pushNamed(context, '/ClaimAccount');
  }

  void _forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/ForgotPassword');
  }
}
