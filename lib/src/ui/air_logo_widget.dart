//import 'package:flutter/material.dart';
//import 'package:flutter_util/flutter_util.dart';
//
/////
///// airLogoWidget
//class airLogoWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _airLogoWidgetState();
//  }
//}
//
/////
///// _airLogoWidgetState
//class _airLogoWidgetState extends State<airLogoWidget> {
//  @override
//  Widget build(BuildContext context) {
//    var screenSize = UiUtil.getScreenSizeOfDp();
//    double screenWidth = screenSize.width;
//    double screenHeight = screenSize.height;
//
//    return Container(
//      width: screenWidth,
//      height: screenHeight / 10 * 3.5,
//      color: Theme.of(context).primaryColor,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            height: 30,
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(
//                "QTMS",
//                style: TextStyle(
//                  fontSize: 12,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//              Text(
//                "涉药物流运输管理",
//                style: TextStyle(
//                  fontSize: 25,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ],
//          ),
//          Container(
//            margin: EdgeInsets.only(
//              top: 5,
//            ),
//            child: Text(
//              "让涉药配送变得安全而简单",
//              style: TextStyle(
//                fontSize: 14,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
