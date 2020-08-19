import 'dart:ui';

import 'package:air_design/src/global/color/air_design_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// AirDesignColorDefaulted
class AirDesignColorDefaulted implements AirDesignColor {
  @override
  Color get primaryColor => Colors.blue;

  @override
  Color get primaryColorDark => Colors.blueAccent;

  @override
  Color get primaryColorLight => Colors.lightBlue;
}
