import 'package:air_design/src/widget/text/app_text_button_widget.dart';
import 'package:flutter/material.dart';

///
/// AppStickyButtonWidget
class AppStickyButtonWidget extends StatefulWidget {
  String? _beginName;
  String? _endName;
  VoidCallback? _beginTapCallback;
  VoidCallback? _endTapCallback;
  bool? _autoEnable;
  bool? _beginTapEnable;
  bool? _endTapEnable;
  AppStickyButtonWidget.defaultStyle({
    String? beginName,
    String? endName,
    VoidCallback? beginTapCallback,
    VoidCallback? endTapCallback,
    bool? autoEnable = false,
    bool? beginTapEnable = true,
    bool? endTapEnable = true,
  }) {
    _beginName = beginName;
    _endName = endName;

    _beginTapCallback = beginTapCallback;
    _endTapCallback = endTapCallback;
    _autoEnable = autoEnable;
    _beginTapEnable = beginTapEnable;
    _endTapEnable = endTapEnable;
  }
  @override
  State<StatefulWidget> createState() {
    return _StickyButtonState();
  }
}

///
/// _StickyButtonState
class _StickyButtonState extends State<AppStickyButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              //whether: tap click enable
              if (widget._beginTapEnable!) {
                //whether: tap callback enable
                if (widget._beginTapCallback != null) {
                  //whether: tap autoEnable
                  if (widget._autoEnable!) {
                    //update state
                    setState(() {
                      widget._beginTapEnable = false;
                    });
                  }

                  //callback
                  widget._beginTapCallback!();
                }
              } else {}
            },
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
              child: AppTextButtonWidget.defaultStyle(
                  data: "${widget._beginName}"),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              //whether: tap click enable
              if (widget._endTapEnable!) {
                //whether: tap callback enable
                if (widget._endTapCallback != null) {
                  //whether: tap autoEnable
                  if (widget._autoEnable!) {
                    //update state
                    setState(() {
                      widget._endTapEnable = false;
                    });
                  }

                  //callback
                  widget._endTapCallback!();
                }
              } else {}
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: widget._endTapCallback == null ||
                        widget._endTapEnable == false
                    ? Colors.grey
                    : Theme.of(context).primaryColor,
                border: Border.all(
                  color: widget._endTapCallback == null ||
                          widget._endTapEnable == false
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                ),
              ),
              alignment: Alignment.center,
              child:
                  AppTextButtonWidget.defaultStyle(data: "${widget._endName}"),
            ),
          ),
        ),
      ],
    );
  }
}
