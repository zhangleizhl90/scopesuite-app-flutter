import 'package:app/colors.dart';
import 'package:app/images.dart';
import 'package:app/pages/base.dart';
import 'package:app/utils.dart';
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
        icon: Images.icProfile(),
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Profile');
        }),
    _Item(
        text: 'DASHBOARD',
        icon: Images.icDashboard(),
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Dashboard');
        }),
    _Item(
        text: 'NOTIFICATIONS',
        icon: Images.icNotifications(),
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Notifications');
        }),
    _Item(
        text: 'RESOURCES',
        icon: Images.icResources(),
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Resources');
        }),
  ];

  

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    startLoading();
    if (!(await isLogined())) {
      Navigator.pushNamed(context, '/SelectRegionPage');
    } else {
      stopLoading();
    }
  }

  @override
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leading: _buildLeading(context),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(buildTitle(), style: TextStyle(color: AppColors.white)),
        actions: buildActions(context),
        centerTitle: true,
        elevation: 0);
  }

  Widget _buildLeading(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/Notifications');
        },
        child: Image(
          image: Images.icNotifications(),
        ));
  }

  @override
  String buildTitle() => 'SCOPESUITE';

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/Settings');
          },
          child: Image(
            image: Images.icSettings(),
          )),
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
                image: _item.icon,
                fit: BoxFit.contain,
              ),
              RowSpace(18),
              Expanded(
                  child: Text(
                _item.text,
                style: TextStyle(fontSize: 18.5, color: Colors.white70),
              )),
              Image(image: Images.icRight())
            ])));
  }
}

class _Item {
  _Item({this.text, this.icon, this.action});

  @required
  String text;
  @required
  AssetImage icon;
  @required
  void Function(BuildContext) action;
}
