import 'package:air_design/src/widget/text/app_text_body_text1_widget.dart';
import 'package:flutter/material.dart';

///
/// AppWarnInfoWidget
/// 提示/警告组件
/// 用于提示重要信息、不可逆信息
class AppWarnInfoWidget extends StatefulWidget {
  final String data;
  final Color color;

  ///
  /// default
  AppWarnInfoWidget.defaultStyle({
    @required this.data,
    this.color = Colors.red,
  }) {}
  @override
  _AppWarnInfoWidgetState createState() => _AppWarnInfoWidgetState();
}

class _AppWarnInfoWidgetState extends State<AppWarnInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: widget.color,
        ),
        AppTextBodyText1Widget.defaultStyle(widget.data),
      ],
    );
  }
}
