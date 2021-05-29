import 'package:flutter/material.dart';

///
/// AppMultipleLineTextWidget
// ignore: must_be_immutable
class AppMultipleLineTextWidget extends StatelessWidget {
  late String _description;
  late TextAlign _textAlign;

  ///
  /// Multiple line default style
  AppMultipleLineTextWidget.defaultStyle(
      {required String description, TextAlign textAlign = TextAlign.end}) {
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
