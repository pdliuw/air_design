import 'package:air_design/src/widget/text/app_text_body_text2_widget.dart';
import 'package:flutter/material.dart';

///
/// AppCheckBoxWidget
class AppCheckBoxWidget extends StatefulWidget {
  String _content;
  bool _value;
  ValueChanged<bool> _onChanged;
  AppCheckBoxWidget.defaultStyle({
    bool value = false,
    String content = '',
    ValueChanged<bool> onChanged,
  }) {
    _value = value;
    _content = content;
    _onChanged = onChanged;
  }
  @override
  _AppCheckBoxWidgetState createState() => _AppCheckBoxWidgetState();
}

class _AppCheckBoxWidgetState extends State<AppCheckBoxWidget> {
  bool _value = true;
  @override
  void initState() {
    super.initState();
    _value = widget._value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            icon: _getIcon(),
            onPressed: () {
              _value = !_value;
              setState(() {
                widget._onChanged(_value);
              });
            }),
        AppTextBodyText2Widget.defaultStyle("${widget._content}"),
      ],
    );
  }

  Icon _getIcon() {
    if (_value) {
      return Icon(
        Icons.check_box,
        color: Colors.blue,
      );
    } else {
      return Icon(
        Icons.check_box_outline_blank,
        color: Colors.grey,
      );
    }
  }
}
