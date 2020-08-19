import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirCalendarInputWidget
class AirCalendarInputWidget extends StatefulWidget {
  AirCalendarInputWidget.defaultStyle({
    VoidCallback voidCallback,
  }) {}
  @override
  _AirCalendarInputState createState() => _AirCalendarInputState();
}

class _AirCalendarInputState extends State<AirCalendarInputWidget> {
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
            child: AirTextWidget.defaultStyle(data: ""),
          ),
          Icon(Icons.calendar_today),
        ],
      ),
    );
  }
}
