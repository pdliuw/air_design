import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

///
/// AirTextWidget
class AirTextWidget extends StatelessWidget {
  String _data;
  bool _isLight;
  bool _isBold;
  AirTextSize _textSize;
  Color _color;
  double _lineHeight;
  AirTextWidget.defaultStyle({
    @required String data,
    bool isLight = false,
    AirTextSize textSize = AirTextSize.small1,
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
