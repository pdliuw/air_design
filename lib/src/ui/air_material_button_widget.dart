import 'package:air_design/src/config/color_config.dart';
import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

///
/// AirMaterialButtonWidget
class AirMaterialButtonWidget extends StatefulWidget {
  VoidCallback _onTap;
  Widget _child;
  Color _color;

  AirMaterialButtonWidget.defaultStyle({
    @required String text,
    VoidCallback onTap,
  }) {
    _child = Text(
      "$text",
      style: textWhiteStyle,
    );
    _onTap = onTap;
  }
  AirMaterialButtonWidget.child({
    @required Widget child,
    VoidCallback onTap,
    Color color,
  }) {
    _child = child;
    _onTap = onTap;
    _color = color;
  }
  @override
  _airMaterialButtonWidgetState createState() =>
      _airMaterialButtonWidgetState();
}

class _airMaterialButtonWidgetState extends State<AirMaterialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget._onTap,
      child: widget._child,
      color: widget._color ?? airColors,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
