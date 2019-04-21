import 'package:app/pages/base.dart';
import 'package:app/colors.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class SelectRegionPage extends BasePage {
  SelectRegionPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<SelectRegionPage> {
  int _currentPage = 1;

  final _bigImages = [
    'images/ic_eu_big.png',
    'images/ic_au_big.png',
    'images/ic_uk_big.png'
  ];

  final _smallImages = [
    'images/ic_eu_small.png',
    'images/ic_au_small.png',
    'images/ic_uk_small.png'
  ];

  final _titles = ["EU", "AU", "UK"];

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 50),
            child: Form(
                child: Column(children: <Widget>[
                  ColumnSpace(35),
                  BigTitle('SELECT', 'REGION'),
                  ColumnSpace(50),
                  _buildPageView(),
                  ColumnSpace(90),
                  Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: PrimaryButton('CONFIRM', onPressed: () {
                        _confirm(context);
                      }))
                ]))));
  }

  Widget _buildPageView() {
    return SizedBox.fromSize(
        size: Size.fromHeight(200),
        child: PageView.builder(
            controller:
            PageController(initialPage: 1, viewportFraction: 0.6),
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _titles.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(index);
            }));
  }

  Widget _buildItem(int index) {
    double left = _currentPage == index ? 0 : 30;
    double right = _currentPage == index ? 0 : 30;
    double top = _currentPage == index ? 0 : 30;
    return Container(
        margin: EdgeInsets.fromLTRB(left, top, right, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(_currentPage == index
                  ? _bigImages[index]
                  : _smallImages[index]),
              fit: BoxFit.contain),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    _titles[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.5,
                        fontWeight: FontWeight.w400),
                  ))
            ]));
  }

  void _confirm(BuildContext context) {
    _currentPage;
    Navigator.pushNamed(context, '/Login');
  }
}
