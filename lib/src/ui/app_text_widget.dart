import 'package:flutter/material.dart';

///
/// AppTextWidget
class AppTextWidget extends StatelessWidget {
  String _data;
  bool _isLight;
  bool _isBold;
  AppTextSize _textSize;
  Color _color;
  double _lineHeight;
  AppTextWidget.defaultStyle({
    @required String data,
    bool isLight = false,
    AppTextSize textSize = AppTextSize.small1,
    bool isBold = false,
    Color color,
    double lineHeight = 2,
  }) {
    _data = data;
    _isLight = isLight;
    _textSize = textSize;
    _isBold = isBold;
    _color = color;
    _lineHeight = lineHeight;
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      _data,
      style: TextStyle(
        color: _isLight
            ? Theme.of(context).primaryColor
            : _color ?? Theme.of(context).textTheme.button.color,
        fontSize: getFontSize(_textSize),
        fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
        height: _lineHeight, //行高比例，两行文字间的举例
      ),
    );
  }
}

enum AppTextSize {
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

/// 通过[AppTextSize]类型去获取相对应的文字大小/尺寸
double getFontSize(AppTextSize appTextSize) {
  double fontSize;
  switch (appTextSize) {
    case AppTextSize.small1:
      fontSize = 12;
      break;
    case AppTextSize.small2:
      fontSize = 10;
      break;
    case AppTextSize.small3:
      fontSize = 8;
      break;
    case AppTextSize.middle1:
      fontSize = 18;
      break;
    case AppTextSize.middle2:
      fontSize = 17;
      break;
    case AppTextSize.middle3:
      fontSize = 16;
      break;
    case AppTextSize.middle4:
      fontSize = 15;
      break;
    case AppTextSize.middle5:
      fontSize = 14;
      break;
    case AppTextSize.middle6:
      fontSize = 13;
      break;
    case AppTextSize.large1:
      fontSize = 24;
      break;
    case AppTextSize.large2:
      fontSize = 22;
      break;
    case AppTextSize.large3:
      fontSize = 20;
      break;
  }
  return fontSize;
}
