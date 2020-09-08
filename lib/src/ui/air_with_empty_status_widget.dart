import 'package:flutter/material.dart';

///
/// AirWithEmptyStatusWidget
/// 待有空数据的样式组件
class AirWithEmptyStatusWidget extends StatefulWidget {
  dynamic _data;
  Widget _child;
  VoidCallback _voidCallback;
  AirWithEmptyStatusWidget.defaultStyle({
    @required dynamic data,
    @required Widget child,
    VoidCallback callback,
  }) {
    _data = data;
    _child = child;
    _voidCallback = callback;
  }
  @override
  _AirWithEmptyStatusWidgetState createState() =>
      _AirWithEmptyStatusWidgetState();
}

class _AirWithEmptyStatusWidgetState extends State<AirWithEmptyStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return _isEmpty()
        ? Container(
            child: Center(
              child: _emptyWidget(),
            ),
          )
        : widget._child;
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
