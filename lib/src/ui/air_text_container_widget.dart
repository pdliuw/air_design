import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirTextContainerWidget
class AirTextContainerWidget extends StatelessWidget {
  String _data;
  AirTextContainerWidget.defaultStyle({
    String data,
  }) {
    _data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: AirTextWidget.defaultStyle(
        data: _data,
        color: Colors.white,
        textSize: AirTextSize.small1,
        lineHeight: 1,
      ),
    );
  }
}
