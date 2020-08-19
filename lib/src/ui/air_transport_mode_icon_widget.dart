import 'package:flutter/material.dart';

///
/// AirTransportModeIconWidget
// ignore: must_be_immutable
class AirTransportModeIconWidget extends StatelessWidget {
  String _transportModeLabel;
  Color _color;
  TransportModeIconSize _transportModeIconSize;

  AirTransportModeIconWidget(
      {String transportModeLabel,
      Color color,
      TransportModeIconSize iconSize = TransportModeIconSize.normal1}) {
    _transportModeLabel = transportModeLabel;
    _color = color;
    _transportModeIconSize = iconSize;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "$_transportModeLabel",
      child: _getTransportModeIcon(_transportModeLabel),
    );
  }

  Widget _getTransportModeIcon(String transportModeLabel) {
    double iconSize = 10;
    if (_transportModeIconSize == TransportModeIconSize.larger1) {
      iconSize = 48;
    } else if (_transportModeIconSize == TransportModeIconSize.larger2) {
      iconSize = 40;
    } else if (_transportModeIconSize == TransportModeIconSize.larger3) {
      iconSize = 34;
    } else if (_transportModeIconSize == TransportModeIconSize.normal1) {
      iconSize = 30;
    } else if (_transportModeIconSize == TransportModeIconSize.normal2) {
      iconSize = 24;
    } else if (_transportModeIconSize == TransportModeIconSize.normal3) {
      iconSize = 18;
    } else if (_transportModeIconSize == TransportModeIconSize.small) {
      iconSize = 12;
    } else {
      iconSize = 24;
    }
    if (transportModeLabel.contains("汽运")) {
      return Icon(
        Icons.directions_bus,
        color: _color,
        size: iconSize,
      );
    } else if (transportModeLabel.contains("铁运")) {
      return Icon(
        Icons.directions_railway,
        color: _color,
        size: iconSize,
      );
    } else if (transportModeLabel.contains("空运")) {
      return Icon(
        Icons.airplanemode_active,
        color: _color,
        size: iconSize,
      );
    } else {
      return Icon(
        Icons.info_outline,
        color: _color,
        size: iconSize,
      );
    }
  }
}

enum TransportModeIconSize {
  larger1,
  larger2,
  larger3,
  normal1,
  normal2,
  normal3,
  small
}
