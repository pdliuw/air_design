import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';

///
/// TestMainPage
class TestMainPage extends StatefulWidget {
  @override
  _TestMainPageState createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  var _data = {
    "startTime": "",
    "endTime": "",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: Column(
        children: [
          AirBorderWidget.defaultStyle(
            padding: 0,
            child: AirSelectStartAndEndTimeWidget(
              mTitle: "选择时间",
              mHideTxt: "请选择时间",
              startTimeValue: "${_data['startTime']}",
              endTimeValue: "${_data['endTime']}",
              onTapStartTime: () {
                AirPickerTimeHelper.showCupertinoDatePicker(
                    context: context,
                    changed: (year, month, day, hour, minute, second) {},
                    onResult: (String result) {
                      setState(() {
                        _data['startTime'] = result;
                      });
                    });
              },
              onTapEndTime: () {
                AirPickerTimeHelper.showCupertinoDatePicker(
                    context: context,
                    changed: (year, month, day, hour, minute, second) {},
                    onResult: (String result) {
                      setState(() {
                        _data['endTime'] = result;
                      });
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
