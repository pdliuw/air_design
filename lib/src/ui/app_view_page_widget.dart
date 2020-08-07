//import 'package:flutter/material.dart';
//
/////
///// AppViewPageWidget
//class AppViewPageWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _ViewPageState();
//  }
//}
//
/////
///// _ViewPageState
//class _ViewPageState extends State<AppViewPageWidget> {
//  var _list = [
//    "assets/images/place_view_page_banner_0.jpeg",
//    "assets/images/place_view_page_banner_1.jpeg",
//    "assets/images/place_view_page_banner_2.jpeg",
//    "assets/images/place_view_page_banner_0.jpeg",
//    "assets/images/place_view_page_banner_1.jpeg",
//    "assets/images/place_view_page_banner_2.jpeg",
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return Swiper(
//      autoplay: true,
//      indicatorLayout: PageIndicatorLayout.COLOR,
//      layout: SwiperLayout.DEFAULT,
//      pagination: SwiperPagination(
//          margin: EdgeInsets.all(0.0),
//          builder: SwiperCustomPagination(
//              builder: (BuildContext context, SwiperPluginConfig config) {
//            return Padding(
//              padding: EdgeInsets.only(
//                bottom: 15,
//              ),
//              child: ConstrainedBox(
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Align(
//                        alignment: Alignment.bottomCenter,
//                        child: DotSwiperPaginationBuilder(
//                                color: Colors.black12,
//                                activeColor: Theme.of(context).primaryColor,
//                                size: 10.0,
//                                activeSize: 20.0)
//                            .build(context, config),
//                      ),
//                    )
//                  ],
//                ),
//                constraints: BoxConstraints.expand(height: 50.0),
//              ),
//            );
//          })),
//      itemBuilder: (BuildContext context, int index) {
//        return Card(
//          elevation: 0,
//          clipBehavior: Clip.antiAlias,
//          margin: EdgeInsets.all(5),
//          child: Image.asset(
//            "${_list[index]}",
//            fit: BoxFit.fill,
//          ),
//        );
//      },
//      itemCount: _list.length,
//      viewportFraction: 0.8,
//      scale: 0.9,
//    );
//  }
//}
