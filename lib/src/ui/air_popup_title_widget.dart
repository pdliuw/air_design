import 'package:flutter/material.dart';

///
/// AirPopupTitleWidget
class AirPopupTitleWidget extends StatelessWidget {
  static String _title;

  ///
  /// [AirPopupTitleWidget.defaultStyle]
  AirPopupTitleWidget.defaultStyle({
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
