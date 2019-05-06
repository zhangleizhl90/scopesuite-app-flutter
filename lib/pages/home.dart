import 'dart:ui';

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
        text: 'COMPETENCY',
        icon: Images.icCompetency(),
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Competency');
        }),
    _Item(
        text: 'RESOURCES',
        icon: Images.icResources(),
        action: (BuildContext context) {
          Navigator.pushNamed(context, '/Resources');
        })
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    startLoading();
    if (!(await isLogined())) {
      Navigator.pushReplacementNamed(context, '/SelectRegionPage');
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
        title: Text(
          buildTitle(),
          style: TextStyle(color: AppColors.white),
        ),
        actions: buildActions(context),
        centerTitle: true,
        elevation: 0);
  }

  Widget _buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Notifications');
      },
      child: Image(image: Images.icNotifications()),
    );
  }

  @override
  String buildTitle() => 'SCOPESUITE';

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      GestureDetector(
        onTap: () {
          showDialog<Null>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return LogoutDialog();
            },
          );
        },
        child: Image(image: Images.icSettings()),
      ),
    ];
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length + 1,
      itemBuilder: (BuildContext context, int position) {
        if (position == 0) {
          return _buildChart(context);
        }
        return _buildItem(context, position - 1);
      },
    );
  }

  _buildChart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ColumnSpace(30),
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            CircleProgressBar(
              radius: 80.0,
              dotColor: AppColors.primaryYellow,
              ringColor: Colors.black26,
              ringWidth: 14,
              shadowWidth: 2.0,
              progress: .6,
            ),
            CircleProgressBar(
              radius: 120.0,
              dotColor: AppColors.primaryGreen,
              ringColor: Colors.black26,
              ringWidth: 14,
              shadowWidth: 2.0,
              progress: .6,
            ),
            CircleProgressBar(
              radius: 160.0,
              dotColor: AppColors.primaryBlue,
              ringColor: Colors.black26,
              ringWidth: 14,
              shadowWidth: 2.0,
              progress: .6,
            )
          ],
        ),
        ColumnSpace(25),
        Row(
          children: <Widget>[
            _buildIndicator(
                AppColors.primaryBlue, "Experience\nIndicator01", 169),
            _buildIndicator(
                AppColors.primaryGreen, "Experience\nIndicator02", 169),
            _buildIndicator(
                AppColors.primaryYellow, "Experience\nIndicator03", 169),
          ],
        ),
        ColumnSpace(5)
      ],
    );
  }

  _buildIndicator(Color color, String text, int number) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(13),
                    ),
                  ),
                  width: 13,
                  height: 13),
              RowSpace(7.5),
              Text(
                "$number",
                style: TextStyle(color: color),
              )
            ],
          ),
          ColumnSpace(12.5),
          Text(
            text,
            style: TextStyle(
                color: AppColors.white80,
                fontSize: 14,
                fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }

  _buildItem(BuildContext context, int position) {
    _Item _item = _items[position];
    return GestureDetector(
      onTap: () {
        _item.action(context);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: Row(
          children: <Widget>[
            Image(
              image: _item.icon,
              fit: BoxFit.contain,
            ),
            RowSpace(18),
            Expanded(
                child: Text(_item.text,
                    style: TextStyle(fontSize: 18.5, color: Colors.white70))),
            Image(image: Images.icRight())
          ],
        ),
      ),
    );
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

class LogoutDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.canvas,
      color: AppColors.black15,
      child: Stack(
        children: <Widget>[
          IgnorePointer(
              ignoring: true,
              child: BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: new Container(color: Colors.black.withOpacity(0.5)))),
          Center(
            child: Container(
              width: double.infinity,
              height: 255,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Images.bgLogout(), fit: BoxFit.contain),
              ),
              padding: EdgeInsets.fromLTRB(25, 60, 25, 40),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Whether to log out?",
                    style: TextStyle(
                        color: AppColors.white90,
                        fontSize: 29,
                        fontWeight: FontWeight.w200),
                  ),
                  ColumnSpace(60),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          borderSide: BorderSide(color: AppColors.primaryBlue),
                          child: Text(
                            "NO",
                            style: TextStyle(
                                color: AppColors.primaryBlue, fontSize: 18.5),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      RowSpace(40),
                      Expanded(
                        child: OutlineButton(
                          borderSide:
                              BorderSide(color: AppColors.primaryYellow),
                          child: Text(
                            "YES",
                            style: TextStyle(
                                color: AppColors.primaryYellow, fontSize: 18.5),
                          ),
                          onPressed: () {
                            removeLoginToken();
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(context, "/Home");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
