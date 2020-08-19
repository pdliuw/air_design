import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirUploadButtonWidget
class AirUploadButtonWidget extends StatefulWidget {
  String _label;
  VoidCallback _onTap;
  AirUploadButtonWidget.defaultStyle({
    VoidCallback onTap,
    String label = "上传",
  }) {
    _onTap = onTap;
    _label = label;
  }
  @override
  _AirUploadButtonWidgetState createState() => _AirUploadButtonWidgetState();
}

class _AirUploadButtonWidgetState extends State<AirUploadButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
        onPressed: widget._onTap,
        icon: Image.asset(
          "assets/images/upload_icon.png",
          width: 20,
          height: 20,
        ),
        label: AirTextWidget.defaultStyle(
          data: widget._label,
          lineHeight: 1.0,
          textSize: AirTextSize.middle4,
        ));
  }
}
