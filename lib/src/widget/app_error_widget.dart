import 'package:flutter/material.dart';

///
/// App Error Widget
class AppErrorWidget extends StatefulWidget {
  late FlutterErrorDetails _flutterErrorDetails;
  AppErrorWidget.defaultStyle({
    required FlutterErrorDetails flutterErrorDetails,
  }) {
    _flutterErrorDetails = flutterErrorDetails;
  }
  @override
  _AppErrorWidgetState createState() => _AppErrorWidgetState();
}

class _AppErrorWidgetState extends State<AppErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          leading: Icon(
            Icons.error,
            color: Colors.red,
          ),
          title: Text("走神了..."),
          childrenPadding: EdgeInsets.all(16),
          expandedAlignment: Alignment.centerLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("请把以下信息发送给技术人员："),
            Divider(),
            Text("异常原因：${widget._flutterErrorDetails.exceptionAsString()}"),
            Divider(),
            Text("异常汇总：${widget._flutterErrorDetails.summary}"),
            Divider(),
            Text("详细信息：${widget._flutterErrorDetails}"),
          ],
        ),
      ],
    );
  }
}
