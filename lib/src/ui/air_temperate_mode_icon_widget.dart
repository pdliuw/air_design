import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

///
/// AirTemperateModeIconWidget
// ignore: must_be_immutable
class AirTemperateModeIconWidget extends StatelessWidget {
  bool _coldChain;
  Color _color;
  String _tooltip;
  TemperateModeIconSize _temperateModeIconSize;

  ///
  /// Constructor
  AirTemperateModeIconWidget(
      {bool coldChain = false,
      String tooltip,
      Color color,
      TemperateModeIconSize iconSize = TemperateModeIconSize.normal1}) {
    _coldChain = coldChain;
    _tooltip = tooltip ?? "${coldChain ? '冷链' : '常温'}";
    _color = color;
    _temperateModeIconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "$_tooltip",
      child: _getTemperateModeIcon(_coldChain),
    );
  }

  Widget _getTemperateModeIcon(bool coldChain) {
    double iconSize = 10;
    if (_temperateModeIconSize == TemperateModeIconSize.larger1) {
      iconSize = 48;
    } else if (_temperateModeIconSize == TemperateModeIconSize.larger2) {
      iconSize = 40;
    } else if (_temperateModeIconSize == TemperateModeIconSize.larger3) {
      iconSize = 34;
    } else if (_temperateModeIconSize == TemperateModeIconSize.normal1) {
      iconSize = 30;
    } else if (_temperateModeIconSize == TemperateModeIconSize.normal2) {
      iconSize = 24;
    } else if (_temperateModeIconSize == TemperateModeIconSize.normal3) {
      iconSize = 18;
    } else if (_temperateModeIconSize == TemperateModeIconSize.small) {
      iconSize = 12;
    } else {
      iconSize = 24;
    }
    if (coldChain) {
      return Icon(
        FontAwesome.snowflake_o,
        color: _color,
        size: iconSize,
      );
    } else {
      return Icon(
        FontAwesome.thermometer_quarter,
        color: _color,
        size: iconSize,
      );
    }
  }
}

enum TemperateModeIconSize {
  larger1,
  larger2,
  larger3,
  normal1,
  normal2,
  normal3,
  small
}
