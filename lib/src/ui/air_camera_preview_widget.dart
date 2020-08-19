//import 'dart:io';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:photo_view/photo_view.dart';
//
/////
///// airCameraPreviewWidget
//class airCameraPreviewWidget extends StatefulWidget {
//  List<String> _imagePathList;
//  airCameraPreviewWidget.defaultStyle({List<String> imageFilePaths}) {
//    _imagePathList = imageFilePaths;
//  }
//  @override
//  State<StatefulWidget> createState() {
//    return _CameraPreviewState();
//  }
//}
//
/////
///// _CameraPreviewState
//class _CameraPreviewState extends State<airCameraPreviewWidget> {
//  int _selectIndex;
//  @override
//  void initState() {
//    super.initState();
//
//    _selectIndex = 0;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      airBar: null,
//      body: Stack(
//        children: <Widget>[
//          PhotoView.customChild(
//            child: Image.file(
//              File(widget._imagePathList.elementAt(_selectIndex)),
//              fit: BoxFit.fitWidth,
//            ),
//          ),
//          Align(
//            alignment: Alignment.bottomCenter,
//            child: Container(
//              height: 300,
//              child: Swiper(
//                loop: false,
//                index: _selectIndex,
//                onTap: (index) {},
//                onIndexChanged: (index) {
//                  setState(() {
//                    _selectIndex = index;
//                  });
//                },
//                itemBuilder: (BuildContext context, int index) {
//                  return Container(
//                    decoration: ShapeDecoration(
//                        color: Colors.white,
//                        shape: RoundedRectangleBorder(
//                          side: BorderSide(
//                              color: Colors.white, style: BorderStyle.solid),
//                          borderRadius: BorderRadius.only(
//                            topLeft: Radius.circular(25),
//                            topRight: Radius.circular(25),
//                            bottomLeft: Radius.circular(0),
//                            bottomRight: Radius.circular(0),
//                          ),
//                        )),
//                    padding: EdgeInsets.only(
//                      left: 5,
//                      top: 5,
//                      right: 5,
//                      bottom: 0,
//                    ),
//                    child: Column(
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.end,
//                          children: <Widget>[
//                            Text("${_selectIndex + 1}",
//                                style: TextStyle(fontSize: 18)),
//                            Text("/${widget._imagePathList.length}",
//                                style: TextStyle(fontSize: 12)),
//                          ],
//                        ),
//                        Expanded(
//                          child: ClipRRect(
//                            borderRadius: BorderRadius.only(
//                              topLeft: Radius.circular(10),
//                              topRight: Radius.circular(10),
//                            ),
//                            child: Image.file(
//                              File(widget._imagePathList.elementAt(index)),
//                              fit: BoxFit.cover,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  );
//                },
//                itemCount: widget._imagePathList.length,
//                viewportFraction: 0.6,
//                scale: 0.6,
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
