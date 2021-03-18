import 'package:air_design/src/widget/text/string/app_string_split_factory.dart';
import 'package:flutter/material.dart';

///
/// AppTextSubtitle1Widget
// ignore: must_be_immutable
class AppTextSubtitle1Widget extends StatelessWidget {
  String _label;
  String _data;
  AppTextSubtitle1Widget.defaultStyle(
    String data, {
    Key key,
    String label,
  }) {
    _label = AppStringHelper.stringEmpty(label);
    _data = AppStringHelper.stringEmpty(data);
    _data = _label + _data;
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle subtitle1 = textTheme.subtitle1;
    return Text(
      _data,
      key: key,
      style: subtitle1,
    );
  }
}
