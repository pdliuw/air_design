import 'package:air_design/src/widget/text/app_text_body_text1_widget.dart';
import 'package:flutter/material.dart';

///
/// AppMultipleLineWithLabelWidget
class AppMultipleLineWithLabelWidget extends StatefulWidget {
  Widget _labelWidget;
  Widget _contentLabel;
  AppMultipleLineWithLabelWidget.defaultStyle({
    @required String labelName,
    @required String content,
  }) {
    _labelWidget = AppTextBodyText1Widget.defaultStyle(labelName ?? "");
    _contentLabel = AppTextBodyText1Widget.defaultStyle(content ?? "");
  }
  @override
  _AppMultipleLineWithLabelWidgetState createState() =>
      _AppMultipleLineWithLabelWidgetState();
}

class _AppMultipleLineWithLabelWidgetState
    extends State<AppMultipleLineWithLabelWidget> {
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
