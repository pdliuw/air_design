import 'package:flutter/material.dart';

typedef AppRadioGroupCallback = Function(bool checked);

///
/// AppRadioGroupWidget

class AppRadioGroupWidget extends StatefulWidget {
  late bool _checked;
  late AppRadioGroupCallback _radioGroupCallback;
  Widget? _leftWidget;
  Widget? _rightWidget;

  AppRadioGroupWidget.defaultStyle({
    required bool checked,
    required AppRadioGroupCallback radioGroupCallback,
    String? leftLabel = "正常",
    String? rightLabel = "异常",
  }) {
    _checked = checked;
    _radioGroupCallback = radioGroupCallback;

    _leftWidget = Text("$leftLabel");
    _rightWidget = Text("$rightLabel");
  }
  @override
  State<StatefulWidget> createState() {
    return _RadioGroupState();
  }
}

///
/// _RadioGroupState
class _RadioGroupState extends State<AppRadioGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              widget._checked = true;
              _callback();
            });
          },
          child: Row(
            children: <Widget>[
              Radio(
                value: true,
                groupValue: widget._checked,
                onChanged: (bool? value) {
                  setState(() {
                    widget._checked = value!;
                    _callback();
                  });
                },
              ),
              widget._leftWidget!,
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget._checked = false;
              _callback();
            });
          },
          child: Row(
            children: <Widget>[
              Radio(
                value: false,
                groupValue: widget._checked,
                onChanged: (bool? value) {
                  setState(() {
                    widget._checked = value!;
                    _callback();
                  });
                },
              ),
              widget._rightWidget!,
            ],
          ),
        ),
      ],
    );
  }

  void _callback() {
    widget._radioGroupCallback(widget._checked);
  }
}
