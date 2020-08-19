import 'package:flutter/material.dart';

///
/// AirMultipleLineTextWidget
// ignore: must_be_immutable
class AirMultipleLineTextWidget extends StatelessWidget {
  String _description;
  TextAlign _textAlign;

  ///
  /// Multiple line default style
  AirMultipleLineTextWidget.defaultStyle(
      {String description, TextAlign textAlign = TextAlign.end}) {
    _description = description ?? '';
    _textAlign = textAlign;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            _description,
            textAlign: _textAlign,
          ),
        ),
      ],
    );
  }
}
