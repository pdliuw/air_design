import 'package:flutter/material.dart';

///
/// AirBodyContainerWidget
class AirBodyContainerWidget extends StatelessWidget {
  Widget _child;
  double _radius;
  AirBodyContainerWidget.defaultStyle({
    @required Widget child,
    double radius = 45,
  }) {
    _child = child;
    _radius = radius;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        margin: EdgeInsets.only(),
        padding: EdgeInsets.only(
          left: 16,
          top: 45,
          right: 16,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
          ),
          color: Colors.white,
        ),
        child: _child,
      ),
    );
  }
}
