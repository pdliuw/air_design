import 'package:air_design/src/widget/text/app_text_headline1_widget.dart';
import 'package:flutter/material.dart';

///
/// AppSingleChildRowWidget
// ignore: must_be_immutable
class AppSingleChildRowWidget extends StatefulWidget {
  Widget? _beginChild;
  Widget? _endChild;
  int _leftFlex = 1;
  int _rightFlex = 2;
  AppSingleChildRowWidget.text({
    required String beginLabel,
    required String endLabel,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AppTextHeadline1Widget.defaultStyle(data: "$beginLabel");
    _endChild = AppTextHeadline1Widget.defaultStyle(data: "$endLabel");
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  AppSingleChildRowWidget.textWithImage({
    required String beginLabel,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AppTextHeadline1Widget.defaultStyle(data: "$beginLabel");
    _endChild = Image.asset(
      "assets/images/emp_image.png",
      width: 24,
      height: 24,
    );
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }

  AppSingleChildRowWidget.upload({
    required String beginLabel,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AppTextHeadline1Widget.defaultStyle(data: "$beginLabel");
    _endChild = OutlineButton.icon(
        onPressed: () {},
        icon: Icon(Icons.file_upload),
        label: AppTextHeadline1Widget.defaultStyle(data: "上传"));
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  AppSingleChildRowWidget.textWithChild({
    required String beginLabel,
    required Widget endChild,
    int leftFlex = 1,
    int rightFlex = 2,
  }) {
    _beginChild = AppTextHeadline1Widget.defaultStyle(data: "$beginLabel");
    _endChild = endChild;
    _leftFlex = leftFlex;
    _rightFlex = rightFlex;
  }
  AppSingleChildRowWidget.widget({
    required Widget beginChild,
    required Widget endChild,
  }) {
    _beginChild = beginChild;
    _endChild = endChild;
  }
  @override
  _AppSingleChildRowWidgetState createState() =>
      _AppSingleChildRowWidgetState();
}

class _AppSingleChildRowWidgetState extends State<AppSingleChildRowWidget> {
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
                  widget._beginChild!,
                ],
              ),
              flex: widget._leftFlex,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  widget._endChild!,
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
