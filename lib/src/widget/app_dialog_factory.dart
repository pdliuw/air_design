import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// AppDialogFactory
class AppDialogFactory {
  ///
  /// showAlertDialog
  static showAlertDialog(
    BuildContext context, {
    String? title,
    String? content,
    VoidCallback? cancel,
    VoidCallback? submit,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("$title"),
          content: Text("$content"),
          actions: <Widget>[
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  if (cancel != null) {
                    cancel();
                  }
                },
                child: Text("取消")),
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  if (submit != null) {
                    submit();
                  }
                },
                child: Text("确定")),
          ],
        );
      },
    );
  }

  ///
  /// 提示用户，并且支持用户点击
  static showIKnowDialog(
    BuildContext context, {
    String? title,
    String? content,
    VoidCallback? cancel,
    VoidCallback? submit,
  }) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title ?? ""),
            content: Text(content ?? ""),
            actions: [
              CupertinoDialogAction(
                child: Text("知道了"),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (submit != null) {
                    submit.call();
                  }
                },
              ),
            ],
          );
        });
  }

  static showNodeReportDialog() {}
}
