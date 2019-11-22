import 'package:app/http/card/card_detail_response.dart';
import 'package:app/http/index.dart';
import 'package:app/utils.dart';
import 'package:app/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../exception.dart';
import 'base.dart';

class CardDetailPage extends BasePage {
  final int cardId;

  CardDetailPage({Key key, @required this.cardId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardDetailStage(cardId);
}

class _CardDetailStage extends BasePageState<CardDetailPage> {
  CardDetail _cardDetail;

  String _comment;
  int cardId;

  _CardDetailStage(this.cardId) : super();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget buildBody(BuildContext context) {
    if (_cardDetail == null) {
      return Center(
          child: Text("No Data",
              style: TextStyle(fontSize: 18.5, color: Colors.white70)));
    }
    return Column(
      children: <Widget>[
        Expanded(
            child: Column(children: <Widget>[
          Text("Learner Name: ${_cardDetail.learner?.fullName}",
              style: TextStyle(fontSize: 18.5, color: Colors.white70)),
          Text("Receipt No: ${_cardDetail.id}",
              style: TextStyle(fontSize: 18.5, color: Colors.white70)),
        ])),
        Row(children: <Widget>[
          Expanded(
              child: TextField(
                      decoration: InputDecoration(
                        hintText: "Please input comment...",
                        hintStyle: TextStyle(
                            color: AppColors.white30,
                            fontSize: 21,
                            fontWeight: FontWeight.w200),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.white06,
                      ),
                      minLines: 1,
                      maxLines: 50,
                      onChanged: _onCommentChange,
                      style: TextStyle(fontSize: 18.5, color: Colors.white70)))
        ]),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton("Reject", onPressed: () {
                _submitCard(false);
              }),
            ),
            Expanded(
              child: TextButton("Accept",
               onPressed: () {
                _submitCard(true);
              }),
            )
          ],
        )
      ],
    );
  }

  @override
  String buildTitle() => 'SUBMIT';

  _fetchData() async {
    startLoading();
    try {
      final cardListResponse = await getCardDetail(cardId);
      setState(() {
        _cardDetail = cardListResponse.card;
      });
    } catch (err) {
      if (err is UnauthorizedException) {
        goToLogin();
      }
    } finally {
      stopLoading();
    }
  }

  _onCommentChange(String comment) {
    setState(() {
      this._comment = comment;
    });
  }

  _submitCard(bool isVerified) async {
    // Validate Date
    if (this._comment == null || this._comment.isEmpty) {
      showAlert(context, "Please fill in comment.");
      return;
    }
    startLoading();
    try {
      await submitCard(cardId, isVerified, this._comment);
      Navigator.pop(context);
    } finally {
      stopLoading();
    }
  }
}
