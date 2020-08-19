import 'package:air_design/src/config/text_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
/// AirAppBarFactory
///  create appBar instance method/function
class AirAppBarFactory {
  ///
  ///create air bar instance.
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
