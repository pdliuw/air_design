import 'package:flutter/material.dart';

///
/// AppPopupTitleWidget
class AppPopupTitleWidget extends StatelessWidget {
  static String _title;

  ///
  /// [AppPopupTitleWidget.defaultStyle]
  AppPopupTitleWidget.defaultStyle({
    String title,
  }) {
    _title = title;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      "$_title",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
