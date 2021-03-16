import 'package:air_design/src/widget/text/app_text_headline6_widget.dart';
import 'package:flutter/material.dart';

import 'app_table_row_text_widget.dart';

///
/// AppTableWidget
class AppTableWidget extends StatefulWidget {
  List<List<String>> _tabData;
  String _titleName;
  Widget _title;
  Widget _child;
  bool _showTitle;
  bool _showPadding;

  AppTableWidget.defaultStyle({
    @required List<List<String>> tableData,
    String titleName,
    Widget title,
    bool showTitle = true,
    bool showPadding = true,
  }) {
    _tabData = tableData;
    _titleName = titleName;
    _title = title;
    _showTitle = showTitle;
    _showPadding = showPadding;
  }

  AppTableWidget.child({
    @required List<List<String>> tableData,
    String titleName,
    Widget title,
    Widget child,
  }) {
    _tabData = tableData;
    _titleName = titleName;
    _title = title;
    _child = child;
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
      padding: EdgeInsets.all(widget._showPadding ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget._showTitle
              ? Column(
                  children: <Widget>[
                    widget._title ??
                        AppTextHeadline6Widget.defaultStyle(
                          "${widget._titleName}",
                        ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    )),
                  ],
                )
              : Container(),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                color: Color(0xffdddddd), width: 1.0, style: BorderStyle.solid),
            children: widget._tabData.map((e) {
              return TableRow(
                  children: e.map((e) {
                Widget child = widget._child ??
                    AppTableRowTextWidget.defaultStyle(
                      description: _content("$e"),
                    );
                return child;
              }).toList());
            }).toList(),
          )
        ],
      ),
    );
  }

  String _content(String tabContent) {
    if (tabContent == null || tabContent.isEmpty || tabContent == "null") {
      return "--";
    }
    return tabContent;
  }
}
