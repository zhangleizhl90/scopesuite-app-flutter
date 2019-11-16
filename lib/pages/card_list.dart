import 'package:app/http/card/card_list_response.dart';
import 'package:app/http/index.dart';
import 'package:app/widgets/index.dart';
import 'package:flutter/material.dart';

import '../images.dart';
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
        margin: EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: Row(
          children: <Widget>[
            Text(
              "${item.id}",
                style: TextStyle(fontSize: 18.5, color: Colors.white70)
            ),
            RowSpace(18),
            Expanded(
                child: Text(item.comment,
                    style: TextStyle(fontSize: 18.5, color: Colors.white70))),
            Image(image: Images.icRight())
          ],
        ),
      ),
    );
  }

  _fetchData() async {
    startLoading();
    final cardListResponse = await getCardList();
    setState(() {
      _items = cardListResponse.cards;
    });

    stopLoading();
  }

  _gotoCardDetail(CardItem item) {
    Navigator.pushNamed(context, '/CardList', arguments: {
      'cardId': item.id
    });
  }

}