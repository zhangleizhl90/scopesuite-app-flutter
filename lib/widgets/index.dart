export 'package:app/widgets/buttons.dart';
export 'package:app/widgets/input_fields.dart';
export 'package:app/widgets/texts.dart';
export 'package:app/widgets/checkbox.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 18,
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
