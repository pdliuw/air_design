import 'package:flutter/material.dart';

///
/// AirDividerWithoutLineWidget
class AirDividerWithoutLineWidget extends StatelessWidget {
  double _height;
  AirDividerWithoutLineWidget.defaultStyle({
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
