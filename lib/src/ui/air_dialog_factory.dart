import 'package:flutter/material.dart';

///
/// AirDialogFactory
class AirDialogFactory {
  ///
  /// showAlertDialog
  static showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("title"),
          content: Text("content"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                textTheme: ButtonTextTheme.normal,
                child: Text("取消")),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("确定")),
          ],
        );
      },
    );
  }

  static showNodeReportDialog() {}
}
