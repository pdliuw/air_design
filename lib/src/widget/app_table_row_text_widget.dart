import 'package:air_design/src/widget/text/app_text_body_text2_widget.dart';
import 'package:flutter/material.dart';

///
/// AppTableRowTextWidget
class AppTableRowTextWidget extends StatelessWidget {
  String _description;
  AppTableRowTextWidget.defaultStyle({
    String description,
  }) {
    _description = description ?? "";
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: AppTextBodyText2Widget.defaultStyle(
        _description,
      ),
    );
  }
}
