import 'package:flutter/material.dart';

///
/// AirSelectStartAndEndTimeWidget
class AirSelectStartAndEndTimeWidget extends StatefulWidget {
  final String mTitle;
  final String mHideTxt;
  final String startTimeValue;
  final String endTimeValue;
  final VoidCallback onTapStartTime;
  final VoidCallback onTapEndTime;
  AirSelectStartAndEndTimeWidget({
    Key key,
    this.mTitle,
    this.mHideTxt,
    this.startTimeValue,
    this.endTimeValue,
    this.onTapStartTime,
    this.onTapEndTime,
  }) : super(key: key);
  @override
  _AirSelectStartAndEndTimeWidgetState createState() =>
      _AirSelectStartAndEndTimeWidgetState();
}

class _AirSelectStartAndEndTimeWidgetState
    extends State<AirSelectStartAndEndTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "${widget.mTitle}：",
        ),
        Expanded(
          child: Container(
            height: 35,
            alignment: AlignmentDirectional.center,
            child: InkWell(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "${widget.startTimeValue}",
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(
                      Icons.arrow_drop_down,
                    ),
                  )
                ],
              ),
              onTap: widget.onTapStartTime,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "~",
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
            alignment: AlignmentDirectional.center,
            child: InkWell(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "${widget.endTimeValue}",
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(
                      Icons.arrow_drop_down,
                    ),
                  )
                ],
              ),
              onTap: widget.onTapEndTime,
            ),
          ),
        ),
      ],
    );
  }
}
