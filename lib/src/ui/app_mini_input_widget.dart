import 'dart:ui';

import 'package:flutter/material.dart';

class AppMiniInputWidget extends StatefulWidget {
  String _suffixText;
  String _hintText;
  AppMiniInputWidget.defaultStyle({
    String hintText = "请输入",
    String suffixText = "",
  }) {
    _hintText = hintText;
    _suffixText = suffixText;
  }
  @override
  _AppMiniInputWidgetState createState() => _AppMiniInputWidgetState();
}

class _AppMiniInputWidgetState extends State<AppMiniInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 35, maxWidth: 200),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                filled: true,
                fillColor: Colors.white,
                hintText: "${widget._hintText}",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                prefixStyle: TextStyle(
                  color: Colors.black,
                ),
                suffixText: "${widget._suffixText}",
              ),
              scrollPadding: EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
