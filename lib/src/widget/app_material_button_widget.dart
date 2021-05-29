import 'package:air_design/src/widget/text/app_text_body_text1_widget.dart';
import 'package:flutter/material.dart';

///
/// AppMaterialButtonWidget
// ignore: must_be_immutable
class AppMaterialButtonWidget extends StatefulWidget {
  VoidCallback? _onTap;
  Widget? _child;
  Color? _color;
  Color? _textColor;

  ///
  /// Whether auto enable after clicked
  bool? _autoEnable;
  bool? _tapEnable;
  AppMaterialButtonWidget.defaultStyle({
    required String text,
    VoidCallback? onTap,
    Color? color,
    Color? textColor,
    bool? autoEnable = false,
    bool? tapEnable = true,
  }) {
    _child = AppTextBodyText1Widget.defaultStyle(
      data: "$text",
    );
    _onTap = onTap;
    _color = color;
    _textColor = textColor;
    _autoEnable = autoEnable;
    _tapEnable = tapEnable;
  }
  AppMaterialButtonWidget.child({
    required Widget child,
    VoidCallback? onTap,
    Color? color,
    Color? textColor,
    bool? autoEnable = false,
    bool? tapEnable = true,
  }) {
    _child = child;
    _onTap = onTap;
    _color = color;
    _textColor = textColor;
    _autoEnable = autoEnable;
    _tapEnable = tapEnable;
  }
  @override
  _AppMaterialButtonWidgetState createState() =>
      _AppMaterialButtonWidgetState();
}

class _AppMaterialButtonWidgetState extends State<AppMaterialButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (widget._tapEnable!) {
          if (widget._onTap != null) {
            if (widget._autoEnable!) {
              //update state
              setState(() {
                widget._tapEnable = false;
              });
            }
            //callback
            widget._onTap!();
          }
        } else {}
      },
      child: widget._child,
      color: widget._tapEnable!
          ? widget._color ?? Theme.of(context).primaryColor
          : Colors.grey,
      textColor: widget._textColor ?? Colors.white,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
