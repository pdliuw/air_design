import 'package:flutter/material.dart';

///
/// AirBorderWidget
class AirBorderWidget extends StatefulWidget {
  Widget _child;
  AirBorderWidget.defaultStyle({
    @required Widget child,
    double margin = 0,
    double padding = 8,
    Color color = Colors.black,
    double borderWidth = 1.0,
  }) {
    _child = Container(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(color: color, width: borderWidth),
            bottom: BorderSide(color: color, width: borderWidth),
            top: BorderSide(color: color, width: borderWidth),
            right: BorderSide(color: color, width: borderWidth)),
      ),
      child: child,
    );
  }

  AirBorderWidget.custom({
    @required Widget child,
  }) {
    _child = child;
  }
  @override
  _AirBorderWidgetState createState() => _AirBorderWidgetState();
}

class _AirBorderWidgetState extends State<AirBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget._child,
    );
  }
}
