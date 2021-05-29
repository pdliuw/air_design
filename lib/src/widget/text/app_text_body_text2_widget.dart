import 'package:air_design/src/widget/text/string/app_string_split_factory.dart';
import 'package:flutter/material.dart';

///
/// AppTextBodyText2Widget
// ignore: must_be_immutable
class AppTextBodyText2Widget extends StatelessWidget {
  String? _label;
  late String _data;
  AppTextBodyText2Widget.defaultStyle({
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
    TextStyle? bodyText2 = textTheme.bodyText2;
    return Text(
      _data,
      key: key,
      style: bodyText2,
    );
  }
}
