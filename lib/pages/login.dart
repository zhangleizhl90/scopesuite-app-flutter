import 'package:app/http/index.dart';
import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:app/utils.dart';

class LoginPage extends BasePage {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {

  String _email;
  String _password;

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
            child: Form(
              key: _formKey,
                child: Column(children: <Widget>[
              Logo(),
              ColumnSpace(35),
              BigTitle('MEMBER', 'LOGIN'),
              ColumnSpace(30),
              EmailInputField(controller: _emailController, onSaved: _onEmailSaved,),
              ColumnSpace(25),
              PasswordInputField(controller: _passwordController, onSaved: _onPasswordSaved),
              ColumnSpace(25),
              PrimaryButton('LOGIN', onPressed: _login),
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

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _onEmailSaved(String email) {
    _email = email;
  }

  void _onPasswordSaved(String password) {
    _password = password;
  }

  void _login() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      LoginResponse loginResponse = await login(_email, _password);
      this.startLoading();
      await saveLoginToken(loginResponse.token, loginResponse.id);
      this.stopLoading();
      Navigator.popAndPushNamed(context, '/Home');
    }
  }

  void _claimAccount(BuildContext context) {
    Navigator.pushNamed(context, '/ClaimAccount');
  }

  void _forgotPassword(BuildContext context) {
    Navigator.pushNamed(context, '/ForgotPassword');
  }
}
