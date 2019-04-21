import 'package:app/colors.dart';
import 'package:flutter/material.dart';

class BigTitle extends StatelessWidget {
  BigTitle(this.firstTitle, [this.secondTitle]);

  final String firstTitle;
  final String secondTitle;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        child: Text(this.firstTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 40,
                color: AppColors.white,
                letterSpacing: _letterSpacing(),
                fontWeight: FontWeight.w500)),
      ),
      secondTitle != null
          ? Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(this.secondTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 40,
                      color: AppColors.white,
                      letterSpacing: _letterSpacing(),
                      fontWeight: FontWeight.w500)),
            )
          : null
    ]);
  }

  _letterSpacing() {
    if (this.firstTitle.length <= 7 && this.secondTitle.length <= 7) {
      return 8.0;
    }
  }
}

class InfoText extends StatelessWidget {
  InfoText(this.text, {this.fontSize = 17.5});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      this.text,
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          color: AppColors.white60,
          fontSize: this.fontSize,
          fontWeight: FontWeight.w100,
          height: 1.2),
    ));
  }
}
