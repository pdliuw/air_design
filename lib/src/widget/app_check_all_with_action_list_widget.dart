import 'package:air_design/src/widget/text/app_text_button_widget.dart';
import 'package:flutter/material.dart';

import 'app_expanded_button_widget.dart';

///
/// AppCheckAllWithActionListWidget
class AppCheckAllWithActionListWidget extends StatefulWidget {
  late final List list;
  final String checkedName;
  final List<String> actionNameList;
  final List<VoidCallback>? onTapList;
  final ValueChanged<bool>? onChanged;
  AppCheckAllWithActionListWidget.defaultStyle({
    required this.list,
    this.checkedName = "checked",
    this.actionNameList = const [
      "签收",
    ],
    this.onTapList,
    this.onChanged,
  });
  @override
  _AppCheckAllWithActionListWidgetState createState() =>
      _AppCheckAllWithActionListWidgetState();
}

class _AppCheckAllWithActionListWidgetState
    extends State<AppCheckAllWithActionListWidget> {
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
                      _updateCheckAll(checkedAll!);
                    },
                  ),
                  AppTextButtonWidget.defaultStyle(data: "全选"),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: _getActionListWidget(),
        ),
      ],
    );
  }

  _getActionListWidget() {
    if (widget.actionNameList.length != widget.onTapList!.length) {
      return Container();
    }

    List<Widget> actionListWidget = [];

    for (int i = 0; i < widget.actionNameList.length; i++) {
      actionListWidget.add(
        Expanded(
          flex: 3,
          child: AppExpandedButtonWidget.defaultStyle(
            onTap: _actionEnable() ? widget.onTapList![i] : null,
            text: "${widget.actionNameList[i]}",
            leftFlex: 0,
            rightFlex: 0,
          ),
        ),
      );
    }
    return Row(
      children: actionListWidget,
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
        widget.onChanged!(checkedAll);
      }
    });
  }
}
