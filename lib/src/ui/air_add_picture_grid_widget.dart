import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// AirAddPictureGridWidget
class AirAddPictureGridWidget extends StatefulWidget {
  ///File image
  List<File> _imageFileList;
  int _count;

  ///Asset image
  List<String> _imageAssetPathList;

  ///回调按钮事件
  VoidCallback _onSelectBtnPressCall;

  AirAddPictureGridWidget.defaultStyle({
    Key key,
    @required List<File> imageFileList,
    int count = 1,
    VoidCallback onSelectBtnPressCall,
    List<String> imageAssetPathList,
  }) {
    _imageFileList = imageFileList;
    _count = count;
    _onSelectBtnPressCall = onSelectBtnPressCall;
    _imageAssetPathList = imageAssetPathList;
  }
  @override
  _AirAddPictureGridWidgetState createState() =>
      _AirAddPictureGridWidgetState();
}

class _AirAddPictureGridWidgetState extends State<AirAddPictureGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemBuilder: (context, index) {
        print("当前坐标:$index ----- ${widget._count}");
        return IntrinsicHeight(
          child: widget._imageFileList == null || index >= widget._count - 1
              ? (widget._imageAssetPathList == null
                  ? InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 1.0)),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                      onTap: () {
                        //接口回调
                        widget._onSelectBtnPressCall();
                      },
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      child: Image.asset(
                        widget._imageAssetPathList[index],
                        fit: BoxFit.fill,
                      ),
                    ))
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.0)),
                  child: Image.file(
                    widget._imageFileList[index],
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
        );
      },
      itemCount: widget._count,
    );
  }
}
