import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/material.dart';

import 'air_text_widget.dart';

///
/// AirStickyButtonWidget
class AirStickyButtonWidget extends StatefulWidget {
  String _beginName;
  String _endName;
  VoidCallback _beginTapCallback;
  VoidCallback _endTapCallback;
  AirStickyButtonWidget.defaultStyle({
    String beginName,
    String endName,
    VoidCallback beginTapCallback,
    VoidCallback endTapCallback,
  }) {
    _beginName = beginName;
    _endName = endName;

    _beginTapCallback = beginTapCallback;
    _endTapCallback = endTapCallback;
  }
  @override
  State<StatefulWidget> createState() {
    return _StickyButtonState();
  }
}

///
/// _StickyButtonState
class _StickyButtonState extends State<AirStickyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: widget._beginTapCallback,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: ColorTween(begin: Colors.white, end: Colors.black)
                    .transform(0.1),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              alignment: Alignment.center,
              child: AirTextWidget.defaultStyle(
                data: "${widget._beginName}",
                textSize: AirTextSize.middle1,
                lineHeight: 1,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: widget._endTapCallback,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              alignment: Alignment.center,
              child: AirTextWidget.defaultStyle(
                data: "${widget._endName}",
                color: Colors.white,
                textSize: AirTextSize.middle1,
                lineHeight: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
