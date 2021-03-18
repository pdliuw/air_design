import 'dart:ui';

import 'package:air_design/src/widget/text/string/app_string_split_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// AppMiniInputWidget
class AppMiniInputWidget extends StatefulWidget {
  bool _enable;
  ValueChanged<String> _onChanged;
  String _suffixText;
  String _hintText;
  double _maxHeight;
  double _maxWidth;
  TextEditingController _editingController =
      TextEditingController.fromValue(TextEditingValue(text: ""));
  List<TextInputFormatter> _inputFormatter;
  TextInputType _inputType;
  AppMiniInputWidget.defaultStyle({
    bool enable = true,
    ValueChanged<String> onChanged,
    String hintText = "请输入",
    String value = "",
    String suffixText = "",
    double maxHeight = 35,
    double maxWidth = 200,
    List<TextInputFormatter> inputFormatter,
    TextInputType inputType,
    TextEditingController textEditingController,
  }) {
    _inputFormatter = inputFormatter;
    _inputType = inputType;
    _enable = enable;
    _onChanged = onChanged ??
        (String value) {
          print(value);
        };
    _hintText = enable ? hintText : "";
    _suffixText = suffixText;
    _maxHeight = maxHeight;
    _maxWidth = maxWidth;
    if (textEditingController != null) {
      _editingController = textEditingController;
    }
    _editingController.text = AppStringHelper.stringEmpty(value);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _editingController.selection = TextSelection(
          baseOffset: _editingController.text.length,
          extentOffset: _editingController.text.length);
    });
  }

  @override
  _AppMiniInputWidgetState createState() => _AppMiniInputWidgetState();
}

class _AppMiniInputWidgetState extends State<AppMiniInputWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: widget._maxHeight, maxWidth: widget._maxWidth),
            child: TextField(
              controller: widget._editingController,
              style: TextStyle().copyWith(
                fontSize: 12,
              ),
              inputFormatters: widget._inputFormatter,
              keyboardType: widget._inputType,
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
