import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppCircleAvatarDotWidget extends StatelessWidget {
  Color? _dotColor;
  late double _dotDiameter;
  late double _size;
  String? _tooltip;

  AppCircleAvatarDotWidget({
    required String avatar,
  }) {}

  AppCircleAvatarDotWidget.defaultStyle({
    Color? color,
    double size = 24,
    double diameter = 8,
    String? tooltip,
  }) {
    _dotColor = color;
    _size = size;
    _dotDiameter = diameter;
    _tooltip = tooltip;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "${_tooltip ?? ''}",
      child: Container(
        width: _size,
        height: _size,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Container(
            width: _dotDiameter,
            height: _dotDiameter,
            child: CircleAvatar(
              backgroundColor: _dotColor,
            ),
          ),
        ),
      ),
    );
  }
}
