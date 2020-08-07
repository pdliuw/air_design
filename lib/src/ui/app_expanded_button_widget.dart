import 'package:flutter/material.dart';

///
/// AppExpandedButtonWidget
class AppExpandedButtonWidget extends StatefulWidget {
  VoidCallback _voidCallback;
  String _text;
  int _leftFlex;
  int _rightFlex;
  int _centerFlex;
  AppExpandedButtonWidget.defaultStyle({
    @required VoidCallback onTap,
    @required String text,
    int leftFlex = 1,
    int centerFlex = 4,
    int rightFlex = 1,
  }) {
    _voidCallback = onTap;
    _text = text;

    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
    _centerFlex = centerFlex;
  }
  @override
  State<StatefulWidget> createState() {
    return _ExpandedButton();
  }
}

///
/// _ExpandedButton
class _ExpandedButton extends State<AppExpandedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: widget._leftFlex,
          child: Container(),
        ),
        Expanded(
          flex: widget._centerFlex,
          child: Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: RaisedButton(
              onPressed: widget._voidCallback,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text("${widget._text}"),
              elevation: 0,
              disabledElevation: 0,
              focusElevation: 2,
              highlightElevation: 2,
              hoverElevation: 2,
            ),
          ),
        ),
        Expanded(
          flex: widget._rightFlex,
          child: Container(),
        ),
      ],
    );
  }
}
