import 'package:air_design/src/widget/text/app_text_body_text2_widget.dart';
import 'package:flutter/material.dart';

///
/// AppCalendarInputWidget
class AppCalendarInputWidget extends StatefulWidget {
  VoidCallback _callback;
  Widget _hintChild;
  bool _enable;
  double _width;
  AppCalendarInputWidget.defaultStyle({
    VoidCallback voidCallback,
    String hint = '',
    bool enable = true,
    double width = 200,
  }) {
    _enable = enable;
    _callback = voidCallback ?? () {};
    _width = width;
    _hintChild = Container(
      width: width,
      child: AppTextBodyText2Widget.defaultStyle(hint),
    );
  }

  AppCalendarInputWidget.expandedStyle({
    VoidCallback voidCallback,
    String hint = '',
    bool enable = true,
    double width = 200,
  }) {
    _enable = enable;
    _callback = voidCallback ?? () {};
    _width = width;
    _hintChild = Expanded(
      child: AppTextBodyText2Widget.defaultStyle(hint),
    );
  }
  @override
  _AppCalendarInputState createState() => _AppCalendarInputState();
}

class _AppCalendarInputState extends State<AppCalendarInputWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget._callback();
      },
      child: Container(
        width: widget._width,
        height: 35,
//        padding: EdgeInsets.only(
//          left: 8,
//          right: 8,
//        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: widget._enable ? Colors.grey : Colors.grey[400],
              width: widget._enable ? 1 : 0.5,
            ),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: widget._hintChild,
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
