import 'package:flutter/material.dart';

import 'app_card_list_item_tip_widget.dart';

///
/// AppDirectionIconTextWidget
// ignore: must_be_immutable
class AppDirectionIconTextWidget extends StatelessWidget {
  String _description;
  Color _iconColor;
  num _iconNumber;
  double _iconSize;
  List<num> _iconNumberList = [];
  AppDirectionIconTextWidget.defaultStyle({
    String description,
    Color iconColor = Colors.blueGrey,
    double iconSize = 16,
    num iconNumber = 3,
  }) {
    _description = description ?? '';
    _iconColor = iconColor;
    _iconSize = iconSize;
    _iconNumber = iconNumber;

    for (int i = 1; i <= _iconNumber; i++) {
      _iconNumberList.add(i);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 4,
        ),
        Column(
            children: _iconNumberList
                .map((e) => Icon(
                      Icons.arrow_drop_down,
                      size: _iconSize,
                      color: _iconColor,
                    ))
                .toList()),
        Container(
          width: 4,
        ),
        AppCardListItemTipWidget(
          title: _description,
        ),
      ],
    );
  }
}
