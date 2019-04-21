import 'package:app/colors.dart';
import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class HomePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  List<_Item> _items = <_Item>[
    _Item(
        text: 'PROFILE',
        icon: 'images/ic_profile.png',
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Profile');
        }),
    _Item(
        text: 'DASHBOARD',
        icon: 'images/ic_dashboard.png',
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Dashboard');
        }),
    _Item(
        text: 'NOTIFICATIONS',
        icon: 'images/ic_notifications.png',
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Notifications');
        }),
    _Item(
        text: 'RESOURCES',
        icon: 'images/ic_resources.png',
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Resources');
        }),
  ];

  @override
  String buildTitle() => 'SCOPESUITE';

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Settings');
            },
            child: Image(
              image: AssetImage('images/ic_settings.png'),
            )),
      )
    ];
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int position) {
          return _buildItem(context, position);
        });
  }

  _buildItem(BuildContext context, int position) {
    _Item _item = _items[position];
    return GestureDetector(
        onTap: () {
          _item.action(context);
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(25, 40, 25, 0),
            child: Row(children: <Widget>[
              Image(
                image: AssetImage(_item.icon),
                fit: BoxFit.contain,
              ),
              RowSpace(18),
              Expanded(
                  child: Text(
                _item.text,
                style: TextStyle(fontSize: 18.5, color: Colors.white70),
              )),
            ])));
  }
}

class _Item {
  _Item({this.text, this.icon, this.action});

  @required
  String text;
  @required
  String icon;
  @required
  void Function(BuildContext) action;
}
