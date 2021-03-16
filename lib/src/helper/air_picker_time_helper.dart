//import 'package:airoute/airoute.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
/////
///// AirPickerTimeHelper
//class AirPickerTimeHelper {
//  ///
//  ///
//  static void showCupertinoDatePicker({
//    @required
//        BuildContext context,
//    @required
//        Function(
//      int year,
//      int month,
//      int day,
//      int hours,
//      int minute,
//      int second,
//    )
//            changed,
//    Function(String formatResult) onResult,
//  }) {
//    DateTime nowTime = DateTime.now();
//    DateTime cacheDateTime = nowTime;
//    final picker = CupertinoDatePicker(
//      onDateTimeChanged: (DateTime dateTime) {
//        print("the date is ${dateTime.toString()}");
////        changed(date);
//        cacheDateTime = dateTime;
//        print("the date year is ${cacheDateTime.year}");
//        print("the date month is ${cacheDateTime.month}");
//        print("the date day is ${cacheDateTime.day}");
//      },
//      initialDateTime: DateTime.now(),
//      use24hFormat: true,
//      mode: CupertinoDatePickerMode.date,
//    );
//
//    showCupertinoModalPopup(
//        context: context,
//        useRootNavigator: true,
//        builder: (context) {
//          return Container(
//            height: 200,
//            color: Theme.of(context).cardColor,
//            child: Column(
//              children: <Widget>[
//                Container(
//                  color: Theme.of(context).cardColor,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      MaterialButton(
//                        onPressed: () {
//                          Airoute.pop();
//                        },
//                        textTheme: ButtonTextTheme.normal,
//                        child: Text("取消"),
//                      ),
//                      MaterialButton(
//                        onPressed: () {
//                          Airoute.pop();
//                          //选择时间
//                          showCupertinoDateTimePicker(
//                              context: context,
//                              initialDateTime: cacheDateTime,
//                              changed: (int hours, int minute, int second) {
//                                changed(
//                                  cacheDateTime.year,
//                                  cacheDateTime.month,
//                                  cacheDateTime.day,
//                                  hours,
//                                  minute,
//                                  second,
//                                );
//
//                                onResult(
//                                  _getDateAndTimeString(
//                                    year: cacheDateTime.year,
//                                    month: cacheDateTime.month,
//                                    day: cacheDateTime.day,
//                                    hour: hours,
//                                    minute: minute,
//                                    second: second,
//                                  ),
//                                );
//                              });
//                        },
//                        textTheme: ButtonTextTheme.accent,
//                        child: Text(
//                          "确定",
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Flexible(
//                  flex: 1,
//                  child: picker,
//                ),
//              ],
//            ),
//          );
//        });
//  }
//
//  /// Time picker
//  ///
//  /// Time picker of date
//  static void showCupertinoDateTimePicker({
//    @required BuildContext context,
//    @required Function(int hours, int minute, int second) changed,
//    DateTime initialDateTime,
//  }) {
//    DateTime showTime = initialDateTime ?? DateTime.now();
//    DateTime dateAndTime = showTime;
//
//    int cacheHours = showTime.hour;
//    int cacheMinute = showTime.minute;
//    int cacheSecond = showTime.second;
//    final picker = CupertinoTimerPicker(
//      alignment: Alignment.center,
//      initialTimerDuration: Duration(
//        hours: showTime.hour,
//        minutes: showTime.minute,
//        seconds: showTime.second,
//      ),
//      onTimerDurationChanged: (Duration duration) {
//        print("the duration is :${duration.toString()}");
//        print("the duration hours is :${duration.inHours}");
//        print("the duration minute is :${duration.inMinutes}");
//        print("the duration second is :${duration.inSeconds}");
//        //下面(dateAndTime = DateTime()这种方式不可用：因为会有时间差，而且很严重，如果要用下面的方式，则需要处理时间差！
////        dateAndTime = DateTime(
////          showTime.year,
////          showTime.month,
////          showTime.day,
////          duration.inHours,
////          duration.inMinutes,
////          duration.inSeconds,
////        );
//        cacheHours = duration.inHours;
//        cacheMinute = duration.inMinutes - duration.inHours * 60;
//        cacheSecond = duration.inSeconds - duration.inMinutes * 60;
//      },
//    );
//
//    showCupertinoModalPopup(
//      context: context,
//      builder: (context) {
//        return Container(
//          height: 200,
//          color: Theme.of(context).cardColor,
//          child: Column(
//            children: <Widget>[
//              Container(
//                color: Theme.of(context).cardColor,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    MaterialButton(
//                      onPressed: () {
//                        Airoute.pop();
//                      },
//                      textTheme: ButtonTextTheme.normal,
//                      child: Text("取消"),
//                    ),
//                    MaterialButton(
//                      onPressed: () {
//                        Airoute.pop();
//                        changed(cacheHours, cacheMinute, cacheSecond);
//                      },
//                      textTheme: ButtonTextTheme.accent,
//                      child: Text("确定"),
//                    ),
//                  ],
//                ),
//              ),
//              Flexible(
//                flex: 1,
//                child: picker,
//              ),
//            ],
//          ),
//        );
//      },
//    );
//  }
//
//  static String _getDateAndTimeString({
//    int year,
//    int month,
//    int day,
//    int hour,
//    int minute,
//    int second,
//  }) {
//    //增加处理：month取值在[1-12]，当month为'<10'时，例如会显示为'8'修改为显示为'08'
//    //2020-01-10 18:00:05
//    String monthOperated = '';
//    if (month < 10) {
//      monthOperated = '0$month';
//    } else {
//      monthOperated = '$month';
//    }
//    String dayOperated = '';
//    if (day < 10) {
//      dayOperated = '0$day';
//    } else {
//      dayOperated = '$day';
//    }
//
//    String hourOperated = '';
//    if (hour < 10) {
//      hourOperated = '0$hour';
//    } else {
//      hourOperated = '$hour';
//    }
//
//    String minuteOperated = '';
//    if (minute < 10) {
//      minuteOperated = '0$minute';
//    } else {
//      minuteOperated = '$minute';
//    }
//
//    String secondOperated = '';
//    if (second < 10) {
//      secondOperated = '0$second';
//    } else {
//      secondOperated = '$second';
//    }
//
//    return "$year-$monthOperated-$dayOperated $hourOperated:$minuteOperated:$secondOperated";
//  }
//
//  static String _getDateString({
//    DateTime nowTime,
//  }) {
//    //2020-01-10 18:00:05
//    return "${nowTime.year}-${nowTime.month}-${nowTime.day} ${nowTime.hour}:${nowTime.minute}:${nowTime.second}";
//  }
//
//  static String getNowDateString({
//    DateTime dateTime,
//  }) {
//    DateTime nowTime = DateTime.now();
//    return getDateString(dateTime: nowTime);
//  }
//
//  static String getDateString({
//    DateTime dateTime,
//  }) {
//    DateTime nowTime = DateTime.now();
//    //2020-01-10 18:00:05
//    int year = nowTime.year;
//    int month = nowTime.month;
//    int day = nowTime.day;
//    int hour = nowTime.hour;
//    int minute = nowTime.minute;
//    int second = nowTime.second;
//
//    //增加处理：month取值在[1-12]，当month为'<10'时，例如会显示为'8'修改为显示为'08'
//    //2020-01-10 18:00:05
//    String monthOperated = '';
//    if (month < 10) {
//      monthOperated = '0$month';
//    } else {
//      monthOperated = '$month';
//    }
//    String dayOperated = '';
//    if (day < 10) {
//      dayOperated = '0$day';
//    } else {
//      dayOperated = '$day';
//    }
//
//    String hourOperated = '';
//    if (hour < 10) {
//      hourOperated = '0$hour';
//    } else {
//      hourOperated = '$hour';
//    }
//
//    String minuteOperated = '';
//    if (minute < 10) {
//      minuteOperated = '0$minute';
//    } else {
//      minuteOperated = '$minute';
//    }
//
//    String secondOperated = '';
//    if (second < 10) {
//      secondOperated = '0$second';
//    } else {
//      secondOperated = '$second';
//    }
//
//    return "$year-$monthOperated-$dayOperated $hourOperated:$minuteOperated:$secondOperated";
//  }
//
//  ///
//  /// millisecondsSinceEpoch
//  /// 获取当前的时间戳
//  static int getNowDateMillisecondsSinceEpoch() {
//    DateTime nowTime = DateTime.now();
//
//    return nowTime.millisecondsSinceEpoch;
//  }
//
//  /// getDateOfTime
//  /// 获取时间(最小单位：分钟)
//  static String getDateOfTimeUnitSecond({
//    String dateTime,
//  }) {
//    if (dateTime == null || dateTime.isEmpty) {
//      return '--';
//    }
//    DateTime dateTimeParsed = DateTime.parse(dateTime);
//
//    int hour = dateTimeParsed.hour;
//    int minute = dateTimeParsed.minute;
//
//    String hourFormatted = "$hour";
//    String minuteFormatted = "$minute";
//    if (hour < 10) {
//      hourFormatted = '0$hour';
//    }
//    if (minute < 10) {
//      minuteFormatted = '0$minute';
//    }
//    return "$hourFormatted:$minuteFormatted";
//  }
//
//  ///
//  /// 将'时间戳'解析成时间，并格式话时间
//  static String parse({
//    @required String millisecondsSinceEpoch,
//  }) {
//    if (millisecondsSinceEpoch == null || millisecondsSinceEpoch.isEmpty) {
//      return "";
//    }
//    DateTime dateTime;
//    try {
//      int parsed = int.parse(millisecondsSinceEpoch);
//
//      dateTime = DateTime.fromMillisecondsSinceEpoch(parsed);
//    } catch (error) {}
//
//    if (dateTime == null) {
//      //解析异常
//      return "";
//    } else {
//      return getDateString(dateTime: dateTime);
//    }
//  }
//}
