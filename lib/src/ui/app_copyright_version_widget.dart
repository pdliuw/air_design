import 'package:flutter/material.dart';

///
/// AppCopyrightVersionWidget
class AppCopyrightVersionWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppCopyrightVersionWidgetState();
  }
}

///
/// _AppCopyrightVersionWidgetState
class _AppCopyrightVersionWidgetState extends State<AppCopyrightVersionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2,
        left: 5,
        right: 5,
        bottom: 15,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "核心质量标准：《药品经营质量管理规范》《药品冷链物流运作规范》《中华人民共和国药品管理法》",
            style: _getTextStyle(),
          ),
          Text(
            "技术支持 SCMsafe链四方 京ICP备16016509号-1",
            style: _getTextStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 8 : 9,
      letterSpacing: 0, //
      wordSpacing: 1, //一个空格占有的位置
    );
  }
}
