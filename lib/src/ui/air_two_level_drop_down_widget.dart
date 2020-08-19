import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirTwoLevelDropDownWidget
class AirTwoLevelDropDownWidget extends StatefulWidget {
  List<AirTwoLevelDropDownModel> _data = [];
  String _label;
  int _leftFlex, _centerFlex, _rightFlex;
  AirTwoLevelDropDownWidget.defaultStyle({
    @required List<AirTwoLevelDropDownModel> data,
    String label,
    int leftFlex = 2,
    int centerFlex = 3,
    int rightFlex = 3,
  }) {
    _data = data;
    _label = label ?? "";

    _leftFlex = leftFlex;
    _centerFlex = centerFlex;
    _rightFlex = rightFlex;
  }
  @override
  _AirTwoLevelDropDownWidgetState createState() =>
      _AirTwoLevelDropDownWidgetState();
}

class _AirTwoLevelDropDownWidgetState extends State<AirTwoLevelDropDownWidget> {
  ///
  ///AirTwoLevelDropDownModel
  AirTwoLevelDropDownModel _oneLevelValue;

  ///
  ///
  List<String> _twoLevelValue;

  String _twoLevelUiShowValue;
  @override
  void initState() {
    super.initState();

    _oneLevelValue = widget._data.elementAt(0);
    _twoLevelValue = _oneLevelValue.description;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: widget._leftFlex,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[AirTextWidget.defaultStyle(data: widget._label)],
          ),
        ),
        Expanded(
          flex: widget._centerFlex,
          child: DropdownButton(
            isExpanded: true,
            value: _oneLevelValue,
            items: widget._data.map((item) {
              return DropdownMenuItem(
                child: AirTextWidget.defaultStyle(data: "${item.title}"),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _oneLevelValue = value; //一级
                _twoLevelValue = _oneLevelValue.description; //二级
                _twoLevelUiShowValue = null;
              });
            },
          ),
        ),
        Expanded(
          flex: widget._rightFlex,
          child: DropdownButton(
            isExpanded: true,
            value: _twoLevelUiShowValue ?? _twoLevelValue.elementAt(0),
            items: _twoLevelValue.map((item) {
              return DropdownMenuItem(
                child: AirTextWidget.defaultStyle(data: "$item"),
                value: item,
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _twoLevelUiShowValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

///
/// AirTwoLevelDropDownModel
class AirTwoLevelDropDownModel {
  String _title;

  List<String> _description;

  AirTwoLevelDropDownModel.create({
    String title,
    List<String> description,
  }) {
    _title = title;
    _description = description;
  }

  String get title => _title;
  List<String> get description => _description;
}
