import 'package:flutter/material.dart';

///
/// AirContainerListItemWidget
class AirContainerListItemWidget extends StatefulWidget {
  VoidCallback _onTapCallback;
  Widget _child;
  AirContainerListItemWidget.defaultStyle({
    @required Widget child,
    VoidCallback onTapCallback,
  }) {
    assert(child != null);
    _child = child;
    _onTapCallback = onTapCallback;
  }

  @override
  State<StatefulWidget> createState() {
    return _airContainerListItemState();
  }
}

///
/// _airContainerListItemState
class _airContainerListItemState extends State<AirContainerListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._onTapCallback,
      child: Container(
        padding:
            EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
        margin: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            border: Border.all(color: Colors.white, width: 0.5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  spreadRadius: 2.0)
            ]),
        child: widget._child,
      ),
    );
  }
}
