import 'package:flutter/material.dart';

typedef airRadioGroupCallback = Function(bool checked);

///
/// AirRadioGroupWidget

class AirRadioGroupWidget extends StatefulWidget {
  bool _checked;
  airRadioGroupCallback _radioGroupCallback;

  AirRadioGroupWidget.defaultStyle({
    @required bool checked,
    @required airRadioGroupCallback radioGroupCallback,
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
class _RadioGroupState extends State<AirRadioGroupWidget> {
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
