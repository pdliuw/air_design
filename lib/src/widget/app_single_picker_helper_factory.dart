import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_popup_title_widget.dart';

///
/// AppSinglePickerHelperFactory
class AppSinglePickerHelperFactory {
  ///
  /// [show]
  static void showPickerPopup({
    required FixedExtentScrollController fixedExtentScrollController,
    required BuildContext context,
    String? title = '',
    required List<Widget> children,
    VoidCallback? onCancelCallback,
    VoidCallback? onConfirmCallback,
  }) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext dialogContext) {
          return Container(
            color: Colors.white,
            height: 280,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (onCancelCallback != null) {
                            onCancelCallback();
                          }
                        },
                        child: Text(
                          "取消",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Spacer(),
                      AppPopupTitleWidget.defaultStyle(
                        title: "$title",
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (onConfirmCallback != null) {
                            onConfirmCallback();
                          }
                        },
                        child: Text(
                          "确定",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: CupertinoPicker(
                    itemExtent: 50,
                    useMagnifier: true,
                    looping: false,
                    scrollController: fixedExtentScrollController,
                    onSelectedItemChanged: (position) {},
                    children: children,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
