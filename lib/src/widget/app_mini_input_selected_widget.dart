import 'dart:ui';

import 'package:flutter/material.dart';

///
/// AppMiniInputSelectedWidget
// ignore: must_be_immutable
class AppMiniInputSelectedWidget extends StatefulWidget {
  bool? _enable;
  ValueChanged<String>? _onChanged;
  String? _value;
  String? _suffixText;
  String? _hintText;
  double? _maxHeight;
  double? _maxWidth;
  Widget? _icon;
  VoidCallback? _onTap;

  final TextEditingController _editingController =
      TextEditingController.fromValue(TextEditingValue(text: ""));
  AppMiniInputSelectedWidget.defaultStyle({
    bool? enable = true,
    ValueChanged<String>? onChanged,
    String? hintText = "请输入",
    String? value = "",
    String? suffixText = "",
    double? maxHeight = 35,
    double? maxWidth = 200,
    Icon? icon,
    VoidCallback? onTap,
  }) {
    _enable = enable;
    _onChanged = onChanged ?? (String value) {};
    _hintText = hintText;
    _value = value;
    _suffixText = suffixText;
    _maxHeight = maxHeight;
    _maxWidth = maxWidth;
    _icon = icon ?? Icon(Icons.arrow_drop_down);
    _onTap = onTap;
    _editingController.text = "$value";
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _editingController.selection = TextSelection(
          baseOffset: _editingController.text.length,
          extentOffset: _editingController.text.length);
    });
  }

  @override
  _State createState() => _State();
}

class _State extends State<AppMiniInputSelectedWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget._onTap,
      child: Container(
        child: IgnorePointer(
          ignoring: true,
          ignoringSemantics: false,
          child: Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: widget._maxHeight!, maxWidth: widget._maxWidth!),
                child: TextField(
                  controller: widget._editingController,
                  style: TextStyle().copyWith(
                    fontSize: 12,
                  ),
                  onChanged: widget._onChanged,
                  decoration: InputDecoration(
                    enabled: widget._enable!,
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
                    suffixIcon: widget._icon,
                    suffixStyle: TextStyle().copyWith(
                      fontSize: 12,
                    ),
                  ),
                  scrollPadding: EdgeInsets.all(0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
