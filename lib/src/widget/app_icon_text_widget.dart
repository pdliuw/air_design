import 'package:flutter/material.dart';

///
/// IconTextWidget
// ignore: must_be_immutable
class AppIconTextWidget extends StatelessWidget {
  Widget _icon;
  Widget _text;

  double _iconMarginLeft = 5;
  double _textMarginLeft = 5;

  ///
  /// constructor
  AppIconTextWidget({
    Icon icon,
    Text text,
  }) {
    _icon = icon;
    _text = text;
  }

  ///
  /// default style constructor
  AppIconTextWidget.defaultStyle(
      {IconData iconData,
      String description,
      double iconSize,
      Color iconColor = Colors.lightBlue}) {
    _icon = Icon(
      iconData,
      size: iconSize ?? 24,
      color: iconColor,
    );
    if (iconData == null) {
      _icon = Container();
      _iconMarginLeft = 0;
      _textMarginLeft = 0;
    }
    _text = Text(description);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: _icon,
          padding: EdgeInsets.only(
            left: _iconMarginLeft,
            top: 0,
            right: 0,
            bottom: 0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: _textMarginLeft,
            top: 0,
            right: 0,
            bottom: 0,
          ),
          child: _text,
        ),
      ],
    );
  }
}
