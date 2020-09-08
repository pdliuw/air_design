import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

///
/// AirCheckStateWidget
class AirCheckStateWidget extends StatefulWidget {
  bool _checked;
  bool _animated;
  AirCheckStateWidget.defaultStyle({
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
class _CheckState extends State<AirCheckStateWidget> {
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
                  child: Icon(
                    FontAwesome.check_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: widget._checked ? 0 : 1,
                  child: Icon(
                    FontAwesome.check_circle,
                    color: Colors.grey,
                  ),
                )
        ],
      ),
    );
  }
}
