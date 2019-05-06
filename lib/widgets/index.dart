export 'package:app/widgets/buttons.dart';
export 'package:app/widgets/input_fields.dart';
export 'package:app/widgets/texts.dart';
export 'package:app/widgets/checkbox.dart';
export 'package:app/widgets/progress_bar.dart';

import 'package:app/colors.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Scopesuite',
        style: TextStyle(fontSize: 32, color: AppColors.white));
  }
}

class Space extends StatelessWidget {
  Space({this.height = 0.0, this.width = 0.0});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(height: this.height, width: this.width);
  }
}

class ColumnSpace extends Space {
  ColumnSpace(double height) : super(height: height);
}

class RowSpace extends Space {
  RowSpace(double width) : super(width: width);
}

class IndicatorIcon extends StatelessWidget {

  IndicatorIcon({this.width = 6, this.height = 18});

  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            AppColors.primaryBlue,
            AppColors.primaryGreen,
            AppColors.primaryYellow
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(6))),
    );
  }
}

class HDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white40),
    );
  }
}

class VDivider extends StatelessWidget {
  VDivider(this.height);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5,
      height: this.height,
      decoration: BoxDecoration(color: AppColors.white40),
    );
  }
}
