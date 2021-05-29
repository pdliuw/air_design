import 'package:flutter/material.dart';

///
/// AppDividerWithoutLineWidget
class AppDividerWithoutLineWidget extends StatelessWidget {
  late double _height;
  AppDividerWithoutLineWidget.defaultStyle({
    double height = 12,
  }) {
    _height = height;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
    );
  }
}
