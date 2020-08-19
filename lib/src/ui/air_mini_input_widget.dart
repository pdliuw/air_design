import 'dart:ui';

import 'package:flutter/material.dart';

///
/// AirMiniInputWidget
class AirMiniInputWidget extends StatefulWidget {
  bool _enable;
  ValueChanged<String> _onChanged;
  String _value;
  String _suffixText;
  String _hintText;
  AirMiniInputWidget.defaultStyle({
    bool enable = true,
    ValueChanged<String> onChanged,
    String hintText = "请输入",
    String value = "",
    String suffixText = "",
  }) {
    _enable = enable;
    _onChanged = onChanged ?? (String value) {};
    _hintText = hintText;
    _value = value;
    _suffixText = suffixText;
  }
  @override
  _airMiniInputWidgetState createState() => _airMiniInputWidgetState();
}

class _airMiniInputWidgetState extends State<AirMiniInputWidget> {
  TextEditingController _editingController;
  @override
  void initState() {
    super.initState();
    _editingController =
        TextEditingController.fromValue(TextEditingValue(text: widget._value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 35, maxWidth: 200),
            child: TextField(
              controller: _editingController,
              style: TextStyle().copyWith(
                fontSize: 12,
              ),
              onChanged: widget._onChanged,
              decoration: InputDecoration(
                enabled: widget._enable,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                filled: true,
                fillColor: Colors.white,
                hintText: "${widget._hintText}",
                hintStyle: TextStyle().copyWith(
                  fontSize: 12,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                prefixStyle: TextStyle().copyWith(
                  fontSize: 12,
                ),
                suffixText: "${widget._suffixText}",
                suffixStyle: TextStyle().copyWith(
                  fontSize: 12,
                ),
              ),
              scrollPadding: EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
