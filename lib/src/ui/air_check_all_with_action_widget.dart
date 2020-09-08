import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

import 'air_expanded_button_widget.dart';
import 'air_text_widget.dart';

///
/// AppCheckAllWithActionWidget
class AirCheckAllWithActionWidget extends StatefulWidget {
  final List list;
  final String checkedName;
  final String actionName;
  final VoidCallback onTap;
  final ValueChanged<bool> onChanged;
  AirCheckAllWithActionWidget.defaultStyle({
    @required this.list,
    this.checkedName = "checked",
    this.actionName = "签收",
    this.onTap,
    this.onChanged,
  });
  @override
  _AirCheckAllWithActionWidgetState createState() =>
      _AirCheckAllWithActionWidgetState();
}

class _AirCheckAllWithActionWidgetState
    extends State<AirCheckAllWithActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              bool checkedAll = !_checkedAll();
              _updateCheckAll(checkedAll);
            },
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _checkedAll(),
                    onChanged: (checkedAll) {
                      _updateCheckAll(checkedAll);
                    },
                  ),
                  AirTextWidget.defaultStyle(
                    data: "全选",
                    lineHeight: 1,
                    textSize: AirTextSize.middle4,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: AirExpandedButtonWidget.defaultStyle(
            onTap: _actionEnable() ? widget.onTap : null,
            text: "${widget.actionName}",
            leftFlex: 0,
            rightFlex: 0,
          ),
        )
      ],
    );
  }

  bool _checkedAll() {
    int totalNumber = widget.list.length;
    int checkedNumber = 0;
    widget.list.forEach(
      (e) {
        if (e[widget.checkedName]) {
          checkedNumber++;
        }
      },
    );

    return checkedNumber == totalNumber;
  }

  bool _actionEnable() {
    int totalNumber = widget.list.length;
    int checkedNumber = 0;
    widget.list.forEach(
      (e) {
        if (e[widget.checkedName]) {
          checkedNumber++;
        }
      },
    );

    return checkedNumber > 0;
  }

  void _updateCheckAll(bool checkedAll) {
    setState(() {
      widget.list.forEach((element) {
        element[widget.checkedName] = checkedAll;
      });
      if (widget.onChanged != null) {
        widget.onChanged(checkedAll);
      }
    });
  }
}
