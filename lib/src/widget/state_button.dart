import 'package:flutter/material.dart';

/// StateButton
// ignore: must_be_immutable
class StateButton extends StatefulWidget {
  late Widget _child;
  VoidCallback? _onPressed;
  bool? _isLoading;
  Color? _color;
  double? _height;
  double? _width;
  Duration? _duration;
  StateButton({
    required Widget child,
    bool? isLoading = false,
    VoidCallback? onPressed,
    Color? color,
    double? width = 300,
    double? height = 20,
    Duration? duration = const Duration(milliseconds: 300),
  }) {
    _child = child;
    _isLoading = isLoading;
    _onPressed = onPressed;
    _color = color;
    _width = width;
    _height = height;
    _duration = duration;
  }
  @override
  State<StatefulWidget> createState() {
    return _StateButtonState();
  }
}

/// _StateButtonState
class _StateButtonState extends State<StateButton> {
  ///
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget._isLoading!) {
          //加载中状态，不处理手势
        } else {
          //其他状态，处理手势
          widget._onPressed!();
        }
      },
      child: AnimatedContainer(
        duration: widget._duration!,
        width: widget._isLoading! ? 100 : 200,
        height: widget._isLoading! ? 50 : 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget._isLoading! ? 45 : 10),
          color: widget._isLoading!
              ? Theme.of(context).disabledColor
              : widget._color ?? Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget._isLoading! ? CircularProgressIndicator() : widget._child,
          ],
        ),
      ),
    );
  }
}
