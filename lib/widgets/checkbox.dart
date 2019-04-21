import 'package:flutter/widgets.dart';

class AppCheckbox extends StatefulWidget {
  AppCheckbox({this.value = false, this.onCheckedChange});

  @override
  _AppCheckboxState createState() =>
      _AppCheckboxState(this.value, this.onCheckedChange);

  final bool value;
  final ValueChanged<bool> onCheckedChange;
}

class _AppCheckboxState extends State<AppCheckbox> {
  _AppCheckboxState(this.value, this.onCheckedChange);

  bool value;
  ValueChanged<bool> onCheckedChange;

  void _changeSelectedState() {
    setState(() {
      value = !value;
      if (onCheckedChange != null) {
        onCheckedChange(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeSelectedState,
        child: Container(
            height: 25,
            width: 25,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/ic_checkbox_bg.png"),
                    fit: BoxFit.contain)),
            child: value
                ? Image(
                    image: AssetImage("images/ic_checkbox_choosed.png"),
                    fit: BoxFit.contain)
                : null));
  }
}
