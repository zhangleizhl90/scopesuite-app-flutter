import 'package:app/colors.dart';
import 'package:app/exception.dart';
import 'package:app/http/card/card_list_response.dart';
import 'package:app/http/index.dart';
import 'package:app/pages/card_detail.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

import '../images.dart';
import '../utils.dart';
import 'base.dart';

class CardListPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _CardListState();
}

class _CardListState extends BasePageState<CardListPage> {
  List<CardItem> _items = List();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int position) {
        return _buildItem(context, position);
      },
    );
  }

  @override
  String buildTitle() => 'CARD LIST';

  _buildItem(BuildContext context, int position) {
    final item = _items[position];
    return GestureDetector(
      onTap: () {
        _gotoCardDetail(item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white06,
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        margin: EdgeInsets.fromLTRB(25, 40, 25, 0),
        padding: EdgeInsets.all(21.5),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  IndicatorIcon(),
                  RowSpace(13.3),
                  Text("${item.submissionDateTime} - ${item.endDate}",
                    style: TextStyle(fontSize: 21.5, color: Colors.white)),
                ]),
                ColumnSpace(26.7),
                Text("Receipt No: ${item.id}",
                    style: TextStyle(fontSize: 18.5, color: Colors.white70)),
                ColumnSpace(6.7),
                Text("Learner: ${item.learner?.fullName}",
                    style: TextStyle(fontSize: 18.5, color: Colors.white70)),
                ColumnSpace(6.7),
                (item.comment != null && item.comment.isNotEmpty) ?
                  Text("Comment: ${item.comment}",
                      style: TextStyle(fontSize: 18.5, color: Colors.white70))
                : RowSpace(0)
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Image(image: Images.icRight())
          ],
        ),
      ),
    );
  }

  _fetchData() async {
    if (await isLogined()) {
      startLoading();
      try {
        final cardListResponse = await getCardList();
        setState(() {
          _items = cardListResponse.cards;
        });
      } catch (err) {
        if (err is UnauthorizedException) {
          _goToLogin();
        }
      } finally {
        stopLoading();
      }
    } else {
      _goToLogin();
    }
  }

  _goToLogin() {
    Navigator.popAndPushNamed(context, '/Login');
  }

  _gotoCardDetail(CardItem item) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (_) => CardDetailPage(cardId: item.id)));
    _fetchData();
  }
}
