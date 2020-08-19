//import 'package:flutter/material.dart';
//
/////
///// airSelectableTextWidget
//// ignore: must_be_immutable
//class airSelectableTextWidget extends StatelessWidget {
//  String _text;
//
//  ///
//  /// Default style constructor
//  airSelectableTextWidget.defaultStyle({
//    String text,
//  }) {
//    _text = text;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return SelectableText(
//      "$_text",
//      textAlign: TextAlign.start,
//      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//      showCursor: false,
//      autofocus: true,
//      onTap: () {
//        TipHelper.showTip(
//            context: context, tipType: TipType.INFO, message: "长按复制 $_text");
//      },
//    );
//  }
//}
