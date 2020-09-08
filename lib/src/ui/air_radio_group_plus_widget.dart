import 'package:flutter/material.dart';

///
/// AirRadioGroupPlusWidget
class AirRadioGroupPlusWidget extends StatefulWidget {
  List _list;
  IndexedWidgetBuilder _labelWidgetBuilder;
  ValueChanged<int> _onChanged;
  bool _isVertical;
  AirRadioGroupPlusWidget.defaultStyle({
    @required List list,
    @required IndexedWidgetBuilder labelBuilder,
    ValueChanged<int> onChanged,
    bool vertical = true,
  }) {
    _list = list ?? [];
    _labelWidgetBuilder = labelBuilder;
    _onChanged = onChanged ?? (index) {};
    _isVertical = vertical;
  }
  @override
  _RadioGroupWidgetState createState() => _RadioGroupWidgetState();
}

class _RadioGroupWidgetState extends State<AirRadioGroupPlusWidget> {
  int groupValue = 0;

  _getContentWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget._list.length,
      scrollDirection: widget._isVertical ? Axis.vertical : Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              groupValue = index;
              widget._onChanged(index);
            });
          },
          child: RawChip(
            backgroundColor: Colors.white,
            label: widget._labelWidgetBuilder(context, index),
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.only(
              right: 5,
            ),
            avatar: Radio(
              value: index,
              groupValue: groupValue,
              onChanged: (index) {},
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget._isVertical
        ? _getContentWidget()
        : Container(
//            width: 200,
            height: 48,
            child: _getContentWidget(),
          );
  }
}
