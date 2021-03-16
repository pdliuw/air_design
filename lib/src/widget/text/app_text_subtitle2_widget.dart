import 'package:air_design/src/widget/text/string/air_string_split_factory.dart';
import 'package:flutter/material.dart';

///
/// AppTextSubtitle2Widget
// ignore: must_be_immutable
class AppTextSubtitle2Widget extends StatelessWidget {
  String _label;
  String _data;
  AppTextSubtitle2Widget.defaultStyle(
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
    TextStyle subtitle2 = textTheme.subtitle2;
    return Text(
      _data,
      key: key,
      style: subtitle2,
    );
  }
}
