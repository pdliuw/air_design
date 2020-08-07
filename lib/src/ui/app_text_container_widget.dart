import 'package:flutter/material.dart';

import 'app_text_widget.dart';

///
/// AppTextContainerWidget
class AppTextContainerWidget extends StatelessWidget {
  String _data;
  AppTextContainerWidget.defaultStyle({
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
      child: AppTextWidget.defaultStyle(
        data: _data,
        color: Colors.white,
        textSize: AppTextSize.small1,
        lineHeight: 1,
      ),
    );
  }
}
