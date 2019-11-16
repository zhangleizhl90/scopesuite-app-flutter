import 'package:app/colors.dart';
import 'package:app/http/index.dart';
import 'package:app/images.dart';
import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage> {
  ProfileResponse _profile;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    startLoading();
//    ProfileResponse response = await getProfile();
//    setState(() {
//      this._profile = response;
//    });
    stopLoading();
  }

  @override
  Widget buildBody(BuildContext context) {
    if (_profile != null) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  _buildAvatar(),
                  ColumnSpace(15),
                  _buildUsername(),
                  ColumnSpace(15),
                  Text(
                    _profile.qualification,
                    style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w100,
                        color: AppColors.white60),
                  ),
                  ColumnSpace(10),
                  _buildLocation(),
                  ColumnSpace(25),
                  _buildUserInfo(),
                ] +
                _buildSections(),
          ),
        ),
      );
    } else {
      return Center();
    }
  }

  _buildSections() {
    return List<Widget>.generate(_profile.sections.length, (int i) {
      var section = _profile.sections[i];
      return Column(
        children: [
              ColumnSpace(40),
              Row(children: <Widget>[
                RowSpace(5),
                IndicatorIcon(),
                RowSpace(13),
                Expanded(
                  child: Text("${section.header.toUpperCase()} DETAILS",
                      style: TextStyle(
                          color: AppColors.white70,
                          fontWeight: FontWeight.w200,
                          fontSize: 18.5)),
                ),
                Image(image: Images.icDown()),
                RowSpace(5),
              ]),
              ColumnSpace(5)
            ] +
            _buildSectionDetail(section.fields),
      );
    });
  }

  _buildSectionDetail(List<Field> fields) {
    return List<Widget>.generate(fields.length, (int i) {
      Field field = fields[i];
      return Padding(
          padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
          child: Row(children: [
            Text("${field.label.toUpperCase()}:",
                style: TextStyle(
                    color: AppColors.white40,
                    fontWeight: FontWeight.w100,
                    fontSize: 16.5)),
            RowSpace(10),
            Text(field.value ?? "-",
                style: TextStyle(
                    color: AppColors.white70,
                    fontWeight: FontWeight.w100,
                    fontSize: 16.5)),
          ]));
    });
  }

  _buildAvatar() {
    // if (_profile.avatar.endsWith("svg")) {
    //   return SvgPicture.network(
    //     _profile.avatar,
    //     height: 90,
    //     width: 90,
    //     placeholderBuilder: (BuildContext context) => Container(
    //         padding: const EdgeInsets.all(30.0),
    //         child: const CircularProgressIndicator()),
    //   );
    // } else {
      return Image.network(
        _profile.avatar,
        height: 90,
        width: 90,
        fit: BoxFit.contain,
      );
    // }
  }

  _buildUsername() => Text(
        _profile.username,
        style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.normal,
            color: AppColors.white),
      );

  _buildLocation() {
    String location = "No Location";
    if (_profile.city != null && _profile.country != null) {
      location = "${_profile.city}, ${_profile.country}";
    } else if (_profile.city != null) {
      location = _profile.city;
    } else if (_profile.country != null) {
      location = _profile.country;
    }
    return Text(
      location,
      style: TextStyle(
          fontSize: 17.5,
          fontWeight: FontWeight.w100,
          color: AppColors.white60),
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
                      Text(_profile.phone ?? "-",
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
                      Text(_profile.mobile ?? "-",
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
              Text(_profile.email ?? "-",
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
