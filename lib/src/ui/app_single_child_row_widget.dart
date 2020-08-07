import 'package:air_design/src/ui/app_text_widget.dart';
import 'package:flutter/material.dart';

///
/// AppSingleChildRowWidget
class AppSingleChildRowWidget extends StatefulWidget {
  Widget _beginChild;
  Widget _endChild;
  AppSingleChildRowWidget.text({
    @required String beginLabel,
    @required String endLabel,
  }) {
    _beginChild = AppTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = AppTextWidget.defaultStyle(data: "$endLabel");
  }
  AppSingleChildRowWidget.textWithImage({
    @required String beginLabel,
  }) {
    _beginChild = AppTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = Image.asset(
      "assets/images/emp_image.png",
      width: 24,
      height: 24,
    );
  }

  AppSingleChildRowWidget.upload({
    @required String beginLabel,
  }) {
    _beginChild = AppTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = OutlineButton.icon(
        onPressed: () {},
        icon: Icon(Icons.file_upload),
        label: AppTextWidget.defaultStyle(data: "上传"));
  }
  AppSingleChildRowWidget.textWithChild({
    @required String beginLabel,
    @required Widget endChild,
  }) {
    _beginChild = AppTextWidget.defaultStyle(data: "$beginLabel");
    _endChild = endChild;
  }
  AppSingleChildRowWidget.widget({
    @required Widget beginChild,
    @required Widget endChild,
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
                  widget._beginChild,
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  widget._endChild,
                ],
              ),
              flex: 2,
            ),
          ],
        )
      ],
    );
  }
}
