import 'package:flutter/material.dart';

///
/// AppCheckStateWidget
class AppCheckStateWidget extends StatefulWidget {
  bool _checked;
  bool _animated;
  AppCheckStateWidget.defaultStyle({
    bool checked = false,
    bool animated = true,
  }) {
    _checked = checked;
    _animated = animated;
  }
  @override
  State<StatefulWidget> createState() {
    return _CheckState();
  }
}

///
/// _CheckState
class _CheckState extends State<AppCheckStateWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: widget._animated ? 1 : 0),
      child: Stack(
        children: <Widget>[
          widget._checked
              ? AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: widget._checked ? 1 : 0,
                  child: Image.asset(
                    "assets/images/select_check_icon.png",
                    width: 30,
                    height: 30,
                  ),
                )
              : AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: widget._checked ? 0 : 1,
                  child: Image.asset(
                    "assets/images/norm_select_check_icon.png",
                    width: 30,
                    height: 30,
                  ),
                )
        ],
      ),
    );
  }
}
