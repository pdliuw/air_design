import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// AppAppBarFactory
/// Application create appbar instance method/function
class AppAppBarFactory {
  ///
  ///create app bar instance.
  static AppBar appBar({
    @required String titleName,
    Widget title,
    PreferredSizeWidget bottom,
    double elevation = 2,
    List<Widget> actions = const [],
  }) {
    return AppBar(
      title: title ??
          Text(
            "${titleName ?? ''}",
            style: textWhiteStyle,
          ),
      centerTitle: true,
      elevation: elevation,
      iconTheme: IconThemeData(color: Colors.white),
      bottom: bottom,
      actions: actions,
    );
  }
}
