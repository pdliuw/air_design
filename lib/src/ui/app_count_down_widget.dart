import 'dart:async';

import 'package:flutter/material.dart';

///
/// AppCountDownWidget
class AppCountDownWidget extends StatefulWidget {
  VoidCallback _onTap;

  int intervalUnitSecond = 1;
  int timeMax = 30;
  int _currentTime = 30;

  AppCountDownWidget.defaultStyle({
    @required VoidCallback onTap,
  }) {
    assert(onTap != null);
    _onTap = onTap;
  }

  @override
  State<StatefulWidget> createState() {
    return _CountDownState();
  }
}

///
/// _countDownState
class _CountDownState extends State<AppCountDownWidget> {
  Timer _timer;
  @override
  void initState() {
    super.initState();
  }

  bool get isActive {
    if (_timer == null) {
      return false;
    }
    return _timer.isActive;
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
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 18,
      ),
      child: FlatButton(
        onPressed: isActive
            ? null
            : () {
                widget._onTap();
                startCountDown();
              },
        child: Text(
          isActive ? "${widget._currentTime} S" : "获取验证码",
          style: TextStyle(
            color: isActive ? Colors.grey : Theme.of(context).primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
