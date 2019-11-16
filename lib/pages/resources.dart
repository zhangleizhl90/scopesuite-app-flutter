import 'package:app/colors.dart';
import 'package:app/http/index.dart';
import 'package:app/images.dart';
import 'package:app/pages/base.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

class ResourcesPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends BasePageState<ResourcesPage> {
  List<Resource> _items = <Resource>[];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    startLoading();
//    ResourcesResponse response = await getResources();
//    setState(() {
//      this._items = response.resources;
//    });
    stopLoading();
  }

  @override
  Widget buildBody(BuildContext context) {
    if (_items != null && _items.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.fromLTRB(23, 29, 23, 28),
        itemCount: _items.length * 2 - 1,
        itemBuilder: (BuildContext context, int index) {
          if (index % 2 == 0) {
            return _buildItem(_items[index ~/ 2]);
          } else {
            return ColumnSpace(23);
          }
        },
      );
    } else {
      return Center(
          child: Text("No Resources",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w200)));
    }
  }

  Widget _buildItem(Resource resource) {
    return Container(
        padding: EdgeInsets.all(23),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.white06),
        child: Row(
          children: <Widget>[
            IndicatorIcon(
              width: 4.5,
              height: 16,
            ),
            RowSpace(14.5),
            Expanded(
              child: Text(
                resource.label,
                softWrap: true,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Image(
              image: Images.icRight(),
            )
          ],
        ));
  }

  @override
  String buildTitle() => 'RESOURCES';
}
