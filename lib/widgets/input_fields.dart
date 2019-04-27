import 'package:app/colors.dart';
import 'package:flutter/material.dart';

abstract class InputField extends StatelessWidget {
  InputField(this.hintText, {this.controller, this.onSaved});

  final String hintText;
  final TextEditingController controller;
  final FormFieldSetter<String> onSaved;
}

class PasswordInputField extends InputField {
  PasswordInputField(
      {String hintText = 'Password', TextEditingController controller, FormFieldSetter<String> onSaved})
      : super(hintText, controller: controller, onSaved: onSaved);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white15),
      height: 60,
      alignment: Alignment.center,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: this.hintText,
          hintStyle: TextStyle(
              color: AppColors.white30,
              fontSize: 21,
              fontWeight: FontWeight.w200),
          border: InputBorder.none,
          counterText: '' // don't show counter
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.white30, fontSize: 18),
        obscureText: true,
        textInputAction: TextInputAction.done,
        autovalidate: false,
        maxLength: 32,
        onSaved: this.onSaved,
        validator: (password) {
          if (password.length <= 0) {
            return 'Please Input Password';
          }
          return null;
        },
      ),
    );
  }
}

class EmailInputField extends InputField {
  EmailInputField(
      {String hintText = 'Username', TextEditingController controller,  FormFieldSetter<String> onSaved})
      : super(hintText, controller: controller, onSaved: onSaved);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white15),
      height: 60,
      alignment: Alignment.center,
      child: TextFormField(
          decoration: InputDecoration(
            hintText: this.hintText,
            hintStyle: TextStyle(
                color: AppColors.white30,
                fontSize: 21,
                fontWeight: FontWeight.w200),
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.white30, fontSize: 18),
          textInputAction: TextInputAction.next,
          autovalidate: false,
          onSaved: this.onSaved,
          validator: (email) {
            if (email.length <= 0) {
              return 'Please Input Username';
            }
            return null;
          }),
    );
  }
}
