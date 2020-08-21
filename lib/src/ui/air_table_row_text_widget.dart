import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

///
/// AirTableRowTextWidget
class AirTableRowTextWidget extends StatelessWidget {
  String _description;
  AirTableRowTextWidget.defaultStyle({
    String description,
  }) {
    _description = description ?? "";
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        _description,
        textAlign: TextAlign.center,
        style: textContentStyle,
      ),
    );
  }
}