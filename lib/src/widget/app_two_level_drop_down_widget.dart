import 'package:air_design/src/widget/text/app_text_body_text2_widget.dart';
import 'package:flutter/material.dart';

///
/// AppTwoLevelDropDownWidget
class AppTwoLevelDropDownWidget extends StatefulWidget {
  List<AppTwoLevelDropDownModel> _data = [];
  String _label;
  int _leftFlex, _centerFlex, _rightFlex;
  AppTwoLevelDropDownWidget.defaultStyle({
    @required List<AppTwoLevelDropDownModel> data,
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
  _AppTwoLevelDropDownWidgetState createState() =>
      _AppTwoLevelDropDownWidgetState();
}

class _AppTwoLevelDropDownWidgetState extends State<AppTwoLevelDropDownWidget> {
  ///
  ///
  AppTwoLevelDropDownModel _oneLevelValue;

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
            children: <Widget>[
              AppTextBodyText2Widget.defaultStyle(widget._label)
            ],
          ),
        ),
        Expanded(
          flex: widget._centerFlex,
          child: DropdownButton(
            isExpanded: true,
            value: _oneLevelValue,
            items: widget._data.map((item) {
              return DropdownMenuItem(
                child: AppTextBodyText2Widget.defaultStyle("${item.title}"),
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
                child: AppTextBodyText2Widget.defaultStyle("$item"),
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
/// AppTwoLevelDropDownModel
class AppTwoLevelDropDownModel {
  String _title;

  List<String> _description;

  AppTwoLevelDropDownModel.create({
    String title,
    List<String> description,
  }) {
    _title = title;
    _description = description;
  }

  String get title => _title;
  List<String> get description => _description;
}
