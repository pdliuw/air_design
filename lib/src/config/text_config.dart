import 'package:flutter/material.dart';

import 'color_config.dart';

const textWhiteStyle = TextStyle(color: Colors.white);

/// 正常文本样式
const textContentStyle = TextStyle(color: Colors.black, fontSize: 12.0);

const textContentHindStyle = TextStyle(color: splitLineColor, fontSize: 12.0);

const textContent14Style = TextStyle(color: Colors.black, fontSize: 14.0);

const textContentHind14Style = TextStyle(color: splitLineColor, fontSize: 14.0);

const textContentWhiteStyle = TextStyle(color: Colors.white, fontSize: 12.0);

const textContentWhite14Style = TextStyle(color: Colors.white, fontSize: 14.0);

const textBlack15BoldStyle =
    TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold);

const textBlack18BoldStyle =
    TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold);

const textBlack20BoldStyle =
    TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold);

const textContentWhite20BoldStyle =
    TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold);

const textRed15BoldStyle =
    TextStyle(color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.bold);

const textRed25BoldStyle =
    TextStyle(color: Colors.red, fontSize: 25.0, fontWeight: FontWeight.bold);

const textcyan15BoldStyle =
    TextStyle(color: airColors, fontSize: 15.0, fontWeight: FontWeight.bold);

const textBlue15BoldStyle =
    TextStyle(color: Colors.blue, fontSize: 15.0, fontWeight: FontWeight.bold);

const textcyan16BoldStyle =
    TextStyle(color: airColors, fontSize: 16.0, fontWeight: FontWeight.bold);

enum AirTextSize {
  small1,
  small2,
  small3,
  middle1,
  middle2,
  middle3,
  middle4,
  middle5,
  middle6,
  large1,
  large2,
  large3,
}

/// 通过[AirTextSize]类型去获取相对应的文字大小/尺寸
double getFontSize(AirTextSize airTextSize) {
  double fontSize;
  switch (airTextSize) {
    case AirTextSize.small1:
      fontSize = 12;
      break;
    case AirTextSize.small2:
      fontSize = 10;
      break;
    case AirTextSize.small3:
      fontSize = 8;
      break;
    case AirTextSize.middle1:
      fontSize = 18;
      break;
    case AirTextSize.middle2:
      fontSize = 17;
      break;
    case AirTextSize.middle3:
      fontSize = 16;
      break;
    case AirTextSize.middle4:
      fontSize = 15;
      break;
    case AirTextSize.middle5:
      fontSize = 14;
      break;
    case AirTextSize.middle6:
      fontSize = 13;
      break;
    case AirTextSize.large1:
      fontSize = 24;
      break;
    case AirTextSize.large2:
      fontSize = 22;
      break;
    case AirTextSize.large3:
      fontSize = 20;
      break;
  }
  return fontSize;
}
