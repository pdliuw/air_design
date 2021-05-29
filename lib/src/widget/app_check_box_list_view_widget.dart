import 'package:flutter/material.dart';

///
/// CheckboxListViewItemChanged
typedef CheckboxListViewItemChanged = void Function(int index, bool checked);

///
/// AppCheckBoxListViewWidget
/// [CheckboxListViewItemChanged]
class AppCheckBoxListViewWidget extends StatefulWidget {
  List? _list;
  IndexedWidgetBuilder? _labelWidgetBuilder;
  late bool _isVertical;
  ValueChanged<bool>? _checkAllChanged;
  CheckboxListViewItemChanged? _checkboxListViewItemChanged;
  Widget? _titleWidget;
  AppCheckBoxListViewWidget.defaultStyle({
    List? list,
    IndexedWidgetBuilder? labelBuilder,
    CheckboxListViewItemChanged? itemChanged,
    ValueChanged<bool>? checkAllChanged,
    String titleName = '',
    bool vertical = true,
  }) {
    _list = list ?? [];
    _labelWidgetBuilder = labelBuilder;
    _checkboxListViewItemChanged = itemChanged ?? (index, checked) {};
    _checkAllChanged = checkAllChanged ?? (checkedAll) {};
    _isVertical = vertical;
    _titleWidget = Text("$titleName");
  }

  @override
  _AppCheckBoxListViewWidgetState createState() =>
      _AppCheckBoxListViewWidgetState();
}

class _AppCheckBoxListViewWidgetState extends State<AppCheckBoxListViewWidget> {
  _getContentWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget._list!.length,
      scrollDirection: widget._isVertical ? Axis.vertical : Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        dynamic itemData = widget._list![index];

        return Row(
          children: <Widget>[
            Checkbox(
              value: itemData['checked'],
              onChanged: (bool? checked) {
                print(checked);
                setState(() {
                  itemData['checked'] = checked!;
                  widget._checkboxListViewItemChanged!(index, checked);
                });
              },
            ),
            widget._labelWidgetBuilder!(context, index),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //init checked status
    widget._list!.forEach((element) {
      element['checked'] = element['checked'] ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget._isVertical
        ? Column(
            children: <Widget>[
              _getTitleWidget(),
              _getContentWidget(),
            ],
          )
        : Container(
            height: 48,
            child: Row(
              children: <Widget>[
                _getTitleWidget(),
                _getContentWidget(),
              ],
            ),
          );
  }

  Widget _getTitleWidget() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _checkAllValue(),
          onChanged: (checkedAllValue) {
            setState(() {
              if (checkedAllValue != null) {
                widget._checkAllChanged!(checkedAllValue);
                widget._list!.forEach((element) {
                  element['checked'] = checkedAllValue;
                });
              }
            });
          },
        ),
        widget._titleWidget!,
      ],
    );
  }

  bool _checkAllValue() {
    int totalNumber = widget._list!.length;
    int checkedNumber = 0;

    widget._list!.forEach((element) {
      bool checked = element['checked'] ?? false;
      if (checked) {
        checkedNumber++;
      }
    });

    if (checkedNumber == 0) {
      return false;
    } else if (checkedNumber > 0 && checkedNumber < totalNumber) {
      return false;
    } else {
      return true;
    }
  }
}
