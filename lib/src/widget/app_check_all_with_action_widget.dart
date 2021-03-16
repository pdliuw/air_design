import 'package:air_design/src/widget/text/app_text_button_widget.dart';
import 'package:flutter/material.dart';

import 'app_expanded_button_widget.dart';

///
/// AppCheckAllWithActionWidget
class AppCheckAllWithActionWidget extends StatefulWidget {
  final List list;
  final String checkedName;
  final String actionName;
  final VoidCallback onTap;
  final ValueChanged<bool> onChanged;
  AppCheckAllWithActionWidget.defaultStyle({
    @required this.list,
    this.checkedName = "checked",
    this.actionName = "签收",
    this.onTap,
    this.onChanged,
  });
  @override
  _AppCheckAllWithActionWidgetState createState() =>
      _AppCheckAllWithActionWidgetState();
}

class _AppCheckAllWithActionWidgetState
    extends State<AppCheckAllWithActionWidget> {
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
                  AppTextButtonWidget.defaultStyle("全选"),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: AppExpandedButtonWidget.defaultStyle(
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
