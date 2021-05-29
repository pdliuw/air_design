import 'package:flutter/material.dart';

///
/// AppSelectableTextWidget
// ignore: must_be_immutable
class AppSelectableTextWidget extends StatelessWidget {
  late String _text;

  ///
  /// Default style constructor
  AppSelectableTextWidget.defaultStyle({
    required String text,
  }) {
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      "$_text",
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      showCursor: false,
      autofocus: true,
      onTap: () {},
    );
  }
}
