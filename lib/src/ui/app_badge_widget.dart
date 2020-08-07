import 'package:flutter/material.dart';

///
/// AppBadgeWidget
class AppBadgeWidget extends StatefulWidget {
  Widget _child;

  ///
  /// Default style
  AppBadgeWidget.defaultStyle({
    @required Widget child,
  }) {
    _child = child;
  }
  @override
  _AppBadgeWidgetState createState() => _AppBadgeWidgetState();
}

class _AppBadgeWidgetState extends State<AppBadgeWidget> {
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
