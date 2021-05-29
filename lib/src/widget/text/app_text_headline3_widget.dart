import 'package:air_design/src/widget/text/string/app_string_split_factory.dart';
import 'package:flutter/material.dart';

///
/// AppTextHeadline3Widget
// ignore: must_be_immutable
class AppTextHeadline3Widget extends StatelessWidget {
  String? _label;
  late String _data;
  AppTextHeadline3Widget.defaultStyle({
    required String data,
    Key? key,
    String? label,
  }) {
    _label = AppStringHelper.stringEmpty(label);
    _data = AppStringHelper.stringEmpty(data);
    _data = "$_label" + _data;
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? headline3 = textTheme.headline3;
    return Text(
      _data,
      key: key,
      style: headline3,
    );
  }
}
