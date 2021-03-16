import 'package:flutter/material.dart';

///
/// AppWithEmptyStatusWidget
/// 待有空数据的样式组件
class AppWithEmptyStatusWidget extends StatefulWidget {
  dynamic _data;
  WidgetBuilder _child;
  VoidCallback _voidCallback;
  AppWithEmptyStatusWidget.defaultStyle({
    @required dynamic data,
    @required WidgetBuilder child,
    VoidCallback callback,
  }) {
    _data = data;
    _child = child;
    _voidCallback = callback;
  }
  @override
  _AppWithEmptyStatusWidgetState createState() =>
      _AppWithEmptyStatusWidgetState();
}

class _AppWithEmptyStatusWidgetState extends State<AppWithEmptyStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return _isEmpty()
        ? Container(
            child: Center(
              child: _emptyWidget(),
            ),
          )
        : widget._child(context);
  }

  bool _isEmpty() {
    if (widget._data == null) {
      return true;
    }
    if (widget._data is List) {
      List list = widget._data as List;
      if (list.isEmpty) {
        return true;
      }
    }

    if (widget._data is String) {
      String string = widget._data as String;
      if (string.isEmpty || string == "null") {
        return true;
      }
    }

    return false;
  }

  Widget _emptyWidget() {
    return OutlineButton.icon(
        onPressed: () {
          if (widget._voidCallback != null) {
            widget._voidCallback();
          }
        },
        icon: Icon(Icons.refresh),
        label: Text("无数据"));
  }
}
