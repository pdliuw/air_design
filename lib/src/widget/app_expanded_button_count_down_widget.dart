import 'dart:async';

import 'package:flutter/material.dart';

///
/// AppExpandedButtonCountDownWidget
// ignore: must_be_immutable
class AppExpandedButtonCountDownWidget extends StatefulWidget {
  late final VoidCallback _onTap;

  int intervalUnitSecond = 1;
  int timeMax = 30;
  int _currentTime = 30;

  AppExpandedButtonCountDownWidget.defaultStyle({
    required VoidCallback onTap,
  }) {
    _onTap = onTap;
  }

  @override
  State<StatefulWidget> createState() {
    return _CountDownState();
  }
}

///
/// _countDownState
class _CountDownState extends State<AppExpandedButtonCountDownWidget> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
  }

  bool get isActive {
    if (_timer == null) {
      return false;
    }
    return _timer!.isActive;
  }

  void startCountDown() {
    cancel();
    _timer =
        Timer.periodic(Duration(seconds: widget.intervalUnitSecond), (timer) {
      widget._currentTime--;
      setState(() {
        if (widget._currentTime == 0) {
          timer.cancel(); //倒计时结束取消定时器
          widget._currentTime = widget.timeMax; //重置时间
        } else {}
      });
    });
  }

  void cancel() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: RaisedButton(
              onPressed: isActive
                  ? null
                  : () {
                      widget._onTap();
                      startCountDown();
                    },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text(
                isActive ? "${widget._currentTime} 秒" : "获取验证码",
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.white,
                  fontSize: 16,
                ),
              ),
              elevation: 0,
              disabledElevation: 0,
              focusElevation: 2,
              highlightElevation: 2,
              hoverElevation: 2,
            ),
          ),
        )
      ],
    );
  }
}
