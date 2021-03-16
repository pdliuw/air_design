import 'package:flutter/material.dart';

import 'app_card_outlined_style_widget.dart';

///
/// AppCardElevatedStyleWidget
// ignore: must_be_immutable
class AppCardElevatedStyleWidget extends StatefulWidget {
  Widget _child;
  GestureTapCallback _tapCallback;
  BorderRadiusGeometry _borderRadius;
  bool _checked;
  AppCardElevatedStyleWidget.defaultStyle({
    Widget child,
    GestureTapCallback onTap,
    BorderRadiusGeometry borderRadius,
    bool checked = false,
  }) {
    _child = child;
    _tapCallback = onTap;
    _borderRadius = borderRadius ?? BorderRadius.all(Radius.circular(12));
    _checked = checked;
  }
  @override
  _AppCardOutlinedWidgetState createState() => _AppCardOutlinedWidgetState();
}

class _AppCardOutlinedWidgetState extends State<AppCardElevatedStyleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget._borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(1.0, 1.0),
            blurRadius: 5,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: AppCardOutlinedStyleWidget.defaultStyle(
        onTap: widget._tapCallback,
        child: widget._child,
        checked: widget._checked,
        borderRadius: widget._borderRadius,
      ),
    );
  }
}
