import 'package:air_design/src/widget/text/app_text_body_text2_widget.dart';
import 'package:flutter/material.dart';

///
/// AppTextContainerWidget
// ignore: must_be_immutable
class AppTextContainerWidget extends StatelessWidget {
  late String _data;
  AppTextContainerWidget.defaultStyle({
    required String data,
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
      child: AppTextBodyText2Widget.defaultStyle(
        data: _data,
      ),
    );
  }
}
