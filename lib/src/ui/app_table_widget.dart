import 'package:flutter/material.dart';

import 'app_table_row_text_widget.dart';
import 'app_text_widget.dart';

///
/// AppTableWidget
class AppTableWidget extends StatefulWidget {
  List<List<String>> _tabData;
  String _titleName;
  Widget _title;

  AppTableWidget.defaultStyle({
    @required List<List<String>> tableData,
    String titleName,
    Widget title,
  }) {
    _tabData = tableData;
    _titleName = titleName;
    _title = title;
  }
  @override
  State<StatefulWidget> createState() {
    return _TableState();
  }
}

///
/// _TableState
class _TableState extends State<AppTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget._title ??
              AppTextWidget.defaultStyle(
                data: "${widget._titleName}",
                textSize: AppTextSize.middle4,
              ),
          Padding(
              padding: EdgeInsets.only(
            top: 5,
            bottom: 5,
          )),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                color: Color(0xffdddddd), width: 1.0, style: BorderStyle.solid),
            children: widget._tabData.map((e) {
              return TableRow(
                  children: e
                      .map((e) => AppTableRowTextWidget.defaultStyle(
                            description: "$e",
                          ))
                      .toList());
            }).toList(),
          )
        ],
      ),
    );
  }
}
