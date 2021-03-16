import 'package:air_design/src/widget/text/app_text_body_text2_widget.dart';
import 'package:flutter/material.dart';

///
/// AppInputFieldWidget
class AppInputFieldWidget extends StatefulWidget {
  bool _enable;

  ///
  /// label
  String _label;

  ///
  /// hint
  String _hint;

  int _leftFlex, _centerFlex, _rightFlex;

  ValueChanged<String> _onChanged;

  AppInputFieldWidget.defaultStyle({
    bool inputEnable = true,
    String label,
    String hint,
    int leftFlex = 1,
    int centerFlex = 2,
    int rightFlex = 1,
    ValueChanged<String> onChanged,
  }) {
    _enable = inputEnable;
    _label = label;
    _hint = hint ?? label;

    _leftFlex = leftFlex;
    _centerFlex = centerFlex;
    _rightFlex = rightFlex;

    _onChanged = onChanged ?? (String value) {};
  }
  @override
  _AppInputFieldWidgetState createState() => _AppInputFieldWidgetState();
}

class _AppInputFieldWidgetState extends State<AppInputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(),
          flex: widget._leftFlex,
        ),
        AppTextBodyText2Widget.defaultStyle("${widget._label}"),
        Expanded(
          flex: widget._centerFlex,
          child: TextField(
            onChanged: widget._onChanged,
            enabled: widget._enable,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 8,
                top: 0,
                right: 8,
                bottom: 0,
              ),
              hintText: "${widget._hint}",
              hintStyle: TextStyle(
                fontSize: 12,
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: Container(),
          flex: widget._rightFlex,
        ),
      ],
    );
  }
}
