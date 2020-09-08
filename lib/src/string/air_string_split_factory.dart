import 'package:flutter/material.dart';

///
/// AirStringSplitFactory
class AirStringSplitFactory {
  ///
  /// 对集合数据进行逗号拼接成字符串
  static String splitComma({
    @required List splitList,
    @required String Function(dynamic element) split,
  }) {
    if (splitList == null) return "";
    if (splitList.isEmpty) {
      return "";
    }
    String commaSplit = "";
    splitList.forEach((element) {
      commaSplit = "$commaSplit,${split(element)}";
    });
    commaSplit = commaSplit.replaceFirst(",", "");

    return commaSplit;
  }
}
