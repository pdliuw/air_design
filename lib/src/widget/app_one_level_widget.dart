import 'package:air_design/src/widget/text/app_text_body_text1_widget.dart';
import 'package:flutter/material.dart';

///
/// AppOneLevelWidget
class AppOneLevelWidget extends StatefulWidget {
  String _label;
  List<String> _values;

  int _leftFlex, _rightFlex;

  ValueChanged<String> onChanged;

  bool _isDense;

  ///
  /// DefaultStyle
  AppOneLevelWidget.defaultStyle({
    List<String> values,
    String label,
    int leftFlex = 1,
    int rightFlex = 1,
    bool isDense = true,
    this.onChanged,
  }) {
    _values = values;
    _label = label;

    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
    _isDense = isDense;
  }
  @override
  _AppOneLevelWidgetState createState() => _AppOneLevelWidgetState();
}

class _AppOneLevelWidgetState extends State<AppOneLevelWidget> {
  String _oneLevelValue;
  @override
  void initState() {
    super.initState();

    _oneLevelValue = widget._values.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(),
          flex: widget._leftFlex,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AppTextBodyText1Widget.defaultStyle(widget._label)
          ],
        ),
        Expanded(
          flex: 2,
          child: DropdownButton(
            isExpanded: true,
            isDense: widget._isDense,
            value: _oneLevelValue,
            items: widget._values.map((item) {
              return DropdownMenuItem(
                child: Scrollbar(
                    child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: AppTextBodyText1Widget.defaultStyle(
                    item,
                  ),
                )),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged(value);
              }
              setState(() {
                _oneLevelValue = value; //一级
              });
            },
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
