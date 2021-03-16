import 'package:flutter/material.dart';

///
/// AppExpandedButtonWidget
class AppExpandedButtonWidget extends StatefulWidget {
  VoidCallback _voidCallback;
  String _text;
  int _leftFlex;
  int _rightFlex;
  int _centerFlex;
  Color _color;
  Color _textColor;

  ///
  /// Whether auto enable after clicked
  bool _autoEnable;
  bool _tapEnable;
  AppExpandedButtonWidget.defaultStyle({
    @required VoidCallback onTap,
    @required String text,
    Color color,
    Color textColor,
    bool autoEnable = false,
    bool tapEnable = true,
    int leftFlex = 1,
    int centerFlex = 4,
    int rightFlex = 1,
  }) {
    _voidCallback = onTap;
    _text = text;
    _color = color;
    _textColor = textColor;
    _autoEnable = autoEnable;
    _tapEnable = tapEnable;
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
              onPressed: () {
                if (widget._tapEnable) {
                  if (widget._voidCallback != null) {
                    if (widget._autoEnable) {
                      //update state
                      setState(() {
                        widget._tapEnable = false;
                      });
                    }
                    //callback
                    widget._voidCallback();
                  }
                } else {}
              },
              color: widget._tapEnable
                  ? widget._color ?? Theme.of(context).primaryColor
                  : Colors.grey,
              textColor: widget._textColor ?? Colors.white,
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
