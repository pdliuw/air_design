import 'package:air_design/src/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const EdgeInsetsGeometry _zero = EdgeInsets.all(0);

///
/// AppCardOutlinedStyleWidget
// ignore: must_be_immutable
class AppCardOutlinedStyleWidget extends StatefulWidget {
  Widget? _child;
  GestureTapCallback? _tapCallback;
  BorderRadius? _borderRadius;
  BorderSide? _borderSide;
  double? _elevation;
  EdgeInsetsGeometry? _margin;
  EdgeInsetsGeometry? _padding;
  bool? _checked;

  AppCardOutlinedStyleWidget.defaultStyle({
    Widget? child,
    GestureTapCallback? onTap,
    BorderRadius? borderRadius,
    BorderSide? borderSide,
    double? elevation,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    bool useDefaultMargin = true,
    bool useDefaultPadding = true,
    bool? checked = false,
  }) {
    _child = child;
    _tapCallback = onTap;
    _borderRadius = borderRadius ??
        AppConfig.instance()!.config.cardConfig!.defaultBorderRadius;
    _borderSide = borderSide ??
        AppConfig.instance()!.config.cardConfig!.defaultBorderSide;
    _elevation = elevation ?? 0;
    if (margin == null) {
      this._margin = useDefaultMargin
          ? AppConfig.instance()!.config.cardConfig!.defaultMargin
          : _zero;
    }

    if (_padding == null) {
      this._margin = useDefaultPadding
          ? AppConfig.instance()!.config.cardConfig!.defaultPadding
          : _zero;
    }

    _checked = checked;
  }

  @override
  _AppCardOutlinedWidgetState createState() => _AppCardOutlinedWidgetState();
}

class _AppCardOutlinedWidgetState extends State<AppCardOutlinedStyleWidget> {
  bool _focus = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: widget._margin,
      elevation: widget._elevation,
      shape: RoundedRectangleBorder(
        side: widget._borderSide!,
        borderRadius: widget._borderRadius!,
      ),
      child: InkWell(
        borderRadius: widget._borderRadius,
        onTap: widget._tapCallback,
        onFocusChange: (focus) {
          setState(() {
            _focus = focus;
          });
        },
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: widget._borderRadius,
          child: Container(
            padding: widget._padding,
            child: widget._child,
            foregroundDecoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: widget._borderSide!,
                borderRadius: widget._borderRadius!,
              ),
              color:
                  _focus ? Theme.of(context).splashColor : Colors.transparent,
            ),
            color: widget._checked!
                ? Theme.of(context).splashColor
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
