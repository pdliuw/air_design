import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AppMultipleLineWithLabelWidget
class AirMultipleLineWithLabelWidget extends StatefulWidget {
  Widget _labelWidget;
  Widget _contentLabel;
  AirMultipleLineWithLabelWidget.defaultStyle({
    @required String labelName,
    @required String content,
  }) {
    _labelWidget = AirTextWidget.defaultStyle(data: labelName ?? "");
    _contentLabel = AirTextWidget.defaultStyle(data: content ?? "");
  }
  @override
  _AirMultipleLineWithLabelWidgetState createState() =>
      _AirMultipleLineWithLabelWidgetState();
}

class _AirMultipleLineWithLabelWidgetState
    extends State<AirMultipleLineWithLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget._labelWidget,
        Expanded(
          child: widget._contentLabel,
        ),
      ],
    );
  }
}
