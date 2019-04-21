import 'package:app/pages/base.dart';
import 'package:app/utils.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:app/colors.dart';

class ClaimAccount extends BasePage {
  ClaimAccount({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ClaimAccountState();
}

class _ClaimAccountState extends BasePageState<ClaimAccount> {
  bool _isAgreePolicy = false;

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
        BigTitle('CLAIM YOUR', 'ACCOUNT'),
        ColumnSpace(30),
        EmailInputField(controller: _emailController),
        ColumnSpace(30),
        _buildPrivacyCheckbox(),
        ColumnSpace(50),
        PrimaryButton('CLAIM ACCOUNT', onPressed: () {
          _claimAccount(context);
        }),
        ColumnSpace(25),
        SecondaryButton('LOGIN', onPressed: () {
          _login(context);
        }),
        ColumnSpace(30),
        InfoText(
          'If you have any questions or concerns '
              'about claiming your account, '
              'please do not hesitate to contact to us at '
              'helpdesl@scopesuite.com.au or 0282491880',
          fontSize: 16,
        )
      ],
    ));
  }

  Widget _buildPrivacyCheckbox() {
    return Row(
      children: <Widget>[
        AppCheckbox(
          value: _isAgreePolicy,
          onCheckedChange: (isChecked) {
            setState(() {
              _isAgreePolicy = isChecked;
            });
          },
        ),
        RowSpace(10),
        Expanded(
            child: Text(
          "I agree to the scopesuite privacy policy",
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: AppColors.white60,
              fontSize: 17.5,
              fontWeight: FontWeight.w100),
        ))
      ],
    );
  }

  TextEditingController _emailController = TextEditingController();

  void _login(BuildContext context) {
    Navigator.pushNamed(context, '/Login');
  }

  void _claimAccount(BuildContext context) {
    if (!_isAgreePolicy) {
      showAlert(context, 'Please Read Privacy Policy');
    }
  }
}
