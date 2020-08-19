import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirSingleChildRowWidget
class AirSingleChildRowWidget extends StatefulWidget {
  Widget _beginChild;
  Widget _endChild;
  int _leftFlex = 1;
  int _rightFlex = 2;
  AirSingleChildRowWidget.text({
    @required String beginLabel,
    @required String endLabel,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AirTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = AirTextWidget.defaultStyle(data: "$endLabel");
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  AirSingleChildRowWidget.textWithImage({
    @required String beginLabel,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AirTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = Image.asset(
      "assets/images/emp_image.png",
      width: 24,
      height: 24,
    );
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }

  AirSingleChildRowWidget.upload({
    @required String beginLabel,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AirTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = OutlineButton.icon(
        onPressed: () {},
        icon: Icon(Icons.file_upload),
        label: AirTextWidget.defaultStyle(data: "上传"));
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  AirSingleChildRowWidget.textWithChild({
    @required String beginLabel,
    @required Widget endChild,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AirTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = endChild;
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  AirSingleChildRowWidget.widget({
    @required Widget beginChild,
    @required Widget endChild,
  }) {
    _beginChild = beginChild;
    _endChild = endChild;
  }
  @override
  _airSingleChildRowWidgetState createState() =>
      _airSingleChildRowWidgetState();
}

class _airSingleChildRowWidgetState extends State<AirSingleChildRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  widget._beginChild,
                ],
              ),
              flex: widget._leftFlex,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  widget._endChild,
                ],
              ),
              flex: widget._rightFlex,
            ),
          ],
        )
      ],
    );
  }
}
