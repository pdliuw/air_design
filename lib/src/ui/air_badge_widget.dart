import 'package:flutter/material.dart';

///
/// AirBadgeWidget
class AirBadgeWidget extends StatefulWidget {
  Widget _child;

  ///
  /// Default style
  AirBadgeWidget.defaultStyle({
    @required Widget child,
  }) {
    _child = child;
  }
  @override
  _AirBadgeWidgetState createState() => _AirBadgeWidgetState();
}

class _AirBadgeWidgetState extends State<AirBadgeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: widget._child ?? Container(),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _badgeWidget(),
        )
      ],
    );
  }

  Widget _badgeWidget() {
    return Container(
      width: 10,
      height: 10,
      decoration: ShapeDecoration(
        color: Colors.red,
        shape: CircleBorder(),
      ),
    );
  }
}
