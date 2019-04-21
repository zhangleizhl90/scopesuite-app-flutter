import 'package:app/colors.dart';
import 'package:flutter/material.dart';

abstract class Button extends StatelessWidget {
  Button(this.text, {this.onPressed});

  @required
  final String text;
  @required
  final VoidCallback onPressed;
}

class PrimaryButton extends Button {
  PrimaryButton(String text, {VoidCallback onPressed})
      : super(text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: OutlineButton(
        borderSide: BorderSide(color: Color(0xFFE5CE10)),
        child: Text(
          this.text,
          style: TextStyle(color: Color(0xFFE5CE10), fontSize: 18.5),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}

class SecondaryButton extends Button {
  SecondaryButton(String text, {VoidCallback onPressed})
      : super(text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: OutlineButton(
        borderSide: BorderSide(color: Color(0xFF008BE4)),
        child: Text(
          this.text,
          style: TextStyle(
              color: Color(0xFF008BE4), fontSize: 18.5),
        ),
        onPressed: this.onPressed,
      ),
    );
  }

}

class TextButton extends Button {
  TextButton(String text, {VoidCallback onPressed})
      : super(text, onPressed: onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialButton(
            child: Text(
              this.text,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w100),
            ),
            onPressed: this.onPressed));
  }
}
