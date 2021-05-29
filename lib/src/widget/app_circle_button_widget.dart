import 'package:flutter/material.dart';

///
/// AppCircleButtonWidget
class AppCircleButtonWidget extends StatefulWidget {
  ///
  /// Click listener
  VoidCallback? _onTapUp;

  ///
  /// Animation duration
  Duration? _duration;

  ///
  /// Outer ring color
  Color? _outerRingColor;

  ///
  /// Outer ring width
  double? _outerRingWidth;

  ///
  /// Circle fill color
  Color? _fillColor;

  ///
  /// Circle fill diameter
  double? _diameter;

  ///
  /// default style
  AppCircleButtonWidget.defaultStyle({
    VoidCallback? onTapUp,
    Duration duration = const Duration(seconds: 1),
    double diameter = 80,
    Color fillColor = Colors.green,
    Color? outerRingColor,
    double? outerRingWidth,
  }) {
    assert(duration != null);
    _onTapUp = onTapUp;
    _duration = duration;

    _outerRingColor = outerRingColor ??
        ColorTween(begin: Colors.white, end: fillColor).transform(0.6);

    _outerRingWidth = outerRingWidth ?? diameter / 10;
    _fillColor = fillColor;
    _diameter = diameter;
  }

  @override
  State<StatefulWidget> createState() {
    return _CircleButtonState();
  }
}

///
/// _CircleButtonState
class _CircleButtonState extends State<AppCircleButtonWidget> {
  bool _pressed = false;
  double? _diameterPressed;
  double? _diameter;

  ///
  /// Start pressed state
  _onStartPressed() {
    setState(() {
      _pressed = true;
    });
  }

  ///
  /// Cancel pressed state
  _onCancelPressed() {
    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _diameterPressed = widget._diameter! / 3 * 2;
    _diameter = widget._diameter;
    return GestureDetector(
      onTapDown: (TapDownDetails tapDownDetails) {
        //start press state
        _onStartPressed();
      },
      onTapUp: (TapUpDetails tapUpDetails) {
        //Restore state
        _onCancelPressed();

        //处理点击事件
        widget._onTapUp!();
      },
      onTapCancel: () {
        //Restore state
        _onCancelPressed();
      },
      child: Container(
        width: widget._diameter,
        height: widget._diameter,
        child: Center(
          child: AnimatedContainer(
            decoration: ShapeDecoration(
              color: widget._outerRingColor,
              shape: CircleBorder(
                side: BorderSide.none,
              ),
            ),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: widget._duration!,
            width: _pressed ? _diameterPressed : _diameter,
            height: _pressed ? _diameterPressed : _diameter,
            onEnd: () {
              print("onEnd");
              //开始旋转动画
            },
            child: Container(
              margin: EdgeInsets.all(widget._outerRingWidth!),
              decoration: ShapeDecoration(
                color: widget._fillColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
