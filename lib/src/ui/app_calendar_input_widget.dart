import 'package:air_design/src/ui/app_text_widget.dart';
import 'package:flutter/material.dart';

///
/// AppCalendarInputWidget
class AppCalendarInputWidget extends StatefulWidget {
  AppCalendarInputWidget.defaultStyle({
    VoidCallback voidCallback,
  }) {}
  @override
  _AppCalendarInputState createState() => _AppCalendarInputState();
}

class _AppCalendarInputState extends State<AppCalendarInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(1),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: AppTextWidget.defaultStyle(data: ""),
          ),
          Icon(Icons.calendar_today),
        ],
      ),
    );
  }
}
