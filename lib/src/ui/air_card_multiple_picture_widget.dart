import 'dart:io';

import 'package:flutter/material.dart';

///
/// AirCardMultiplePictureWidget
class AirCardMultiplePictureWidget extends StatefulWidget {
  final List<String> _picturePath = [];
  VoidCallback _onTap;

  ///
  /// default style
  AirCardMultiplePictureWidget.defaultStyle({
    List<String> picturePathList,
    VoidCallback onTap,
  }) {
    _picturePath.addAll(picturePathList);
    _onTap = onTap;
  }
  @override
  State<StatefulWidget> createState() {
    return _MultiplePictureState();
  }
}

///
/// _MultiplePictureState
class _MultiplePictureState extends State<AirCardMultiplePictureWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._onTap,
      child: Card(
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Image.file(File(_getShowPicturePath())),
              Align(
                alignment: Alignment.topRight,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                      color: Theme.of(context).primaryColor,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "${widget._picturePath.length}",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// pictures last picture path
  String _getShowPicturePath() {
    int length = widget._picturePath.length;

    return widget._picturePath.elementAt(length - 1);
  }
}
