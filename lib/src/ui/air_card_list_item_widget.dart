import 'package:flutter/material.dart';

import 'air_dialog_factory.dart';

///
/// AirCardListItemWidget
// ignore: must_be_immutable
class AirCardListItemWidget extends StatelessWidget {
  Widget _childWidget;
  VoidCallback _cardClickCallback;
  bool _moreAction;
  bool _bottomHavePadding;
  EdgeInsetsGeometry _padding;

  AirCardListItemWidget.defaultStyle({
    Widget child,
    VoidCallback itemClickCallback,
    bool moreAction = false,
    EdgeInsetsGeometry padding,
    bool paddingBottom = true,
  }) {
    _childWidget = child;
    _cardClickCallback = itemClickCallback;
    _moreAction = moreAction;
    _bottomHavePadding = paddingBottom;
    _padding = padding;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        padding: _padding ??
            EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: _bottomHavePadding ? 16 : 0,
            ),
        child: _cardClickCallback == null
            ? _getContentWidget(context)
            : InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  if (_cardClickCallback != null) {
                    _cardClickCallback();
                  }
                },
                child: _getContentWidget(context),
              ),
      ),
    );
  }

  Widget _getContentWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        _childWidget,
        _getMoreActions(context),
      ],
    );
  }

  _getMoreActions(BuildContext context) {
    return _moreAction
        ? ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  AirDialogFactory.showAlertDialog(context);
                },
                child: Text("One"),
              ),
            ],
          )
        : Container();
  }
}
