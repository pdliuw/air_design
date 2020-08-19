import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirOneLevelWidget
class AirOneLevelWidget extends StatefulWidget {
  String _label;
  List<String> _values;

  int _leftFlex, _rightFlex;

  ///
  /// DefaultStyle
  AirOneLevelWidget.defaultStyle({
    List<String> values,
    String label,
    int leftFlex = 1,
    int rightFlex = 1,
  }) {
    _values = values;
    _label = label;

    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  @override
  _airOneLevelWidgetState createState() => _airOneLevelWidgetState();
}

class _airOneLevelWidgetState extends State<AirOneLevelWidget> {
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
          children: <Widget>[AirTextWidget.defaultStyle(data: widget._label)],
        ),
        Expanded(
          flex: 2,
          child: DropdownButton(
            isExpanded: true,
            value: _oneLevelValue,
            items: widget._values.map((item) {
              return DropdownMenuItem(
                child: AirTextWidget.defaultStyle(data: item),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
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
