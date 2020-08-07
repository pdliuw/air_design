import 'package:flutter/material.dart';

typedef AppRadioGroupCallback = Function(bool checked);

///
/// AppRadioGroupWidget

class AppRadioGroupWidget extends StatefulWidget {
  bool _checked;
  AppRadioGroupCallback _radioGroupCallback;

  AppRadioGroupWidget.defaultStyle({
    @required bool checked,
    @required AppRadioGroupCallback radioGroupCallback,
  }) {
    _checked = checked;
    _radioGroupCallback = radioGroupCallback;
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
                onChanged: (bool value) {
                  setState(() {
                    widget._checked = value;
                    _callback();
                  });
                },
              ),
              Text("正常"),
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
                onChanged: (bool value) {
                  setState(() {
                    widget._checked = value;
                    _callback();
                  });
                },
              ),
              Text("异常"),
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
