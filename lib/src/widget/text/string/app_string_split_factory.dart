import 'package:flutter/material.dart';

///
///AppStringHelper
class AppStringHelper {
  AppStringHelper._();

  ///
  /// 整个应用的集合进行逗号拼接
  /// [AppStringHelper.splitComma]
  /// splitList:分割的集合
  /// split:分割内容处理函数
  /// splitText:分割文本
  static String splitComma({
    @required List splitList,
    @required dynamic Function(dynamic element) split,
    String splitText = ",",
  }) {
    if (splitList == null) return "";
    if (splitList.isEmpty) {
      return "";
    }
    String commaSplit = "";
    splitList.forEach((element) {
      commaSplit = "$commaSplit$splitText${split(element)}";
    });
    commaSplit = commaSplit.replaceFirst("$splitText", "");

    return commaSplit;
  }

  ///
  /// 整个应用的'发货实体'、'收货实体'进行地址拼接
  static String splitAddress(dynamic data) {
    if (data == null) {
      return "";
    }
    String provinceName = data['provinceName'] ?? "";
    String cityName = data['cityName'] ?? "";
    String regionName = data['regionName'] ?? "";
    String address = data['address'] ?? "";
    return "$provinceName-$cityName-$regionName-$address";
  }

  ///
  /// 整个应用的'发货实体'、'收货实体'进行'公司'拼接
  static String splitCompany(dynamic data) {
    if (data == null) {
      return "";
    }
    String companyName = data['companyName'] ?? "";

    return "$companyName";
  }

  ///
  /// String empty数据处理
  static String stringEmpty(dynamic data) {
    if (isEmpty(data)) {
      return "";
    } else {
      return "$data";
    }
  }

  ///
  /// String empty数据处理(占位符)
  static String stringPlaceHolder(dynamic data) {
    if (isEmpty(data)) {
      return "--";
    } else {
      return "$data";
    }
  }

  ///
  /// 判断是否为空
  static bool isEmpty(dynamic data) {
    if (data == null) {
      return true;
    }
    if (data is String) {
      if (data == "null") {
        return true;
      }
      return data.isEmpty;
    } else if (data is List) {
      return data.isEmpty;
    } else if (data is Map) {
      return data.isEmpty;
    }
    return false;
  }

  ///
  /// System Name(android iOS ...)
  static String systemName({
    @required BuildContext context,
  }) {
    String systemName = "";
    TargetPlatform targetPlatform = Theme.of(context).platform;
    switch (targetPlatform) {
      case TargetPlatform.android:
        systemName = "android";
        break;
      case TargetPlatform.iOS:
        systemName = "iOS";
        break;
      case TargetPlatform.fuchsia:
        systemName = "fuchsia";
        break;
      case TargetPlatform.linux:
        systemName = "linux";
        break;
      case TargetPlatform.macOS:
        systemName = "macOS";
        break;
      case TargetPlatform.windows:
        systemName = "windows";
        break;
    }

    return systemName;
  }
}
