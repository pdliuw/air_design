import 'package:air_design/src/widget/text/string/app_string_split_factory.dart';
import 'package:flutter/material.dart';

///
/// AppTextBodyText1Widget
// ignore: must_be_immutable
class AppTextBodyText1Widget extends StatelessWidget {
  String _label;
  String _data;
  AppTextBodyText1Widget.defaultStyle(
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
    TextStyle bodyText1 = textTheme.bodyText1;
    return Text(
      _data,
      key: key,
      style: bodyText1,
    );
  }
}
