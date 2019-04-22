import 'package:app/colors.dart';
import 'package:app/images.dart';
import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class ProfilePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage> {
  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              height: 90,
              width: 90,
              image: AssetImage('images/ic_profile.png'),
              fit: BoxFit.fitHeight,
            ),
            ColumnSpace(15),
            Text(
              'Louisanna Stewart',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white),
            ),
            ColumnSpace(15),
            Text(
              'Commerce',
              style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w100,
                  color: AppColors.white60),
            ),
            ColumnSpace(10),
            Text(
              'Sydney, Australia',
              style: TextStyle(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w100,
                  color: AppColors.white60),
            ),
            ColumnSpace(25),
            _buildUserInfo(),
            ColumnSpace(40),
            Row(
              children: <Widget>[
                RowSpace(5),
                IndicatorIcon(),
                RowSpace(13),
                Expanded(
                  child: Text("PERSONAL DETAILS",
                      style: TextStyle(
                          color: AppColors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.5)),
                ),
                Image(image: Images.icDown()),
                RowSpace(5),
              ],
            ),
            ColumnSpace(40),
            Row(
              children: <Widget>[
                RowSpace(5),
                IndicatorIcon(),
                RowSpace(13),
                Expanded(
                  child: Text("ADDTIONAL DETAILS",
                      style: TextStyle(
                          color: AppColors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.5)),
                ),
                Image(image: Images.icDown()),
                RowSpace(5),
              ],
            ),
            ColumnSpace(40),
            Row(
              children: <Widget>[
                RowSpace(5),
                IndicatorIcon(),
                RowSpace(13),
                Expanded(
                  child: Text("SUPERVISOR DETAILS",
                      style: TextStyle(
                          color: AppColors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.5)),
                ),
                Image(image: Images.icDown()),
                RowSpace(5),
              ],
            ),
            ColumnSpace(40),
            Row(
              children: <Widget>[
                RowSpace(5),
                IndicatorIcon(),
                RowSpace(13),
                Expanded(
                  child: Text("OFFICE LOCATION DETAILS",
                      style: TextStyle(
                          color: AppColors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 18.5)),
                ),
                Image(image: Images.icDown()),
                RowSpace(5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: AppColors.white06),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RowSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(image: Images.icPhone()),
                      RowSpace(13),
                      Text("027894563",
                          style: TextStyle(
                              fontSize: 17.5,
                              color: AppColors.white,
                              fontWeight: FontWeight.w100))
                    ],
                  ),
                  ColumnSpace(13),
                  Text('Phone Number',
                      style: TextStyle(
                          fontSize: 17.5,
                          color: AppColors.white40,
                          fontWeight: FontWeight.w100))
                ],
              ),
              Expanded(
                child: Center(
                  child: VDivider(50),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image(image: Images.icMobile()),
                      RowSpace(13),
                      Text("027894563",
                          style: TextStyle(
                              fontSize: 17.5,
                              color: AppColors.white,
                              fontWeight: FontWeight.w100))
                    ],
                  ),
                  ColumnSpace(13),
                  Text('Mobile Number',
                      style: TextStyle(
                          fontSize: 17.5,
                          color: AppColors.white40,
                          fontWeight: FontWeight.w100))
                ],
              ),
              RowSpace(10),
            ],
          ),
          ColumnSpace(20),
          HDivider(),
          ColumnSpace(20),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Email",
                style: TextStyle(
                    fontSize: 17.5,
                    color: AppColors.white40,
                    fontWeight: FontWeight.w100),
              ),
              RowSpace(13),
              Text("mobiletest@yahoo.com",
                  style: TextStyle(
                      fontSize: 17.5,
                      color: AppColors.white,
                      fontWeight: FontWeight.w100))
            ],
          )
        ],
      ),
    );
  }

  @override
  String buildTitle() => 'PROFILE';

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
