import 'package:app/http/card/card_detail_response.dart';
import 'package:app/http/card/card_list_response.dart';
import 'package:app/http/index.dart';
import 'package:flutter/material.dart';

import 'base.dart';

class CardDetailPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _CardDetailStage();
}

class _CardDetailStage extends BasePageState<CardDetailPage> {

  CardDetail _cardDetail;
  int _cardId;

  @override
  void initState() {
    super.initState();
    dynamic obj = ModalRoute.of(context).settings.arguments;
    if (obj != null) {
      _cardId = obj['cardId'];
    }
    _fetchData();
  }

  @override
  Widget buildBody(BuildContext context) {
    return null;
  }

  @override
  String buildTitle() => 'SUBMIT';

  _fetchData() async {
    startLoading();
    final cardListResponse = await getCardDetail(_cardId);
    setState(() {
      _cardDetail = cardListResponse.card;
    });

    stopLoading();
  }

  _submitCard(bool isVerified, String comment) async {
    startLoading();
    final response = await submitCard(_cardId, isVerified, comment);
    stopLoading();
  }

}