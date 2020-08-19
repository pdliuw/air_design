import 'package:ai_amap/ai_amap.dart';
import 'package:air_design/src/ui/air_card_list_item_title_h1_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:permission_handler/permission_handler.dart';

///
/// AirAMapLocationAddressWidget
class AirAMapLocationAddressWidget extends StatefulWidget {
  AirAiAMapLocationType _aiAMapLocationType;
  LocationResultCallback _locationResultTest;

  ///
  ///
  AirAMapLocationAddressWidget.defaultStyle({
    AirAiAMapLocationType locationType = AirAiAMapLocationType.summary,
    LocationResultCallback locationResultCallback,
  }) {
    //assert
    assert(locationType != null);

    //
    _aiAMapLocationType = locationType;
    _locationResultTest = locationResultCallback;
  }
  @override
  State<StatefulWidget> createState() {
    return _locationState();
  }
}

///
/// _locationState
class _locationState extends State<AirAMapLocationAddressWidget> {
  static const String LOCATION_TIP_DEFAULT =
      "定位中....(为保证正常使用定位、地理围栏、导航等功能，请允许应用可以'始终'访问位置信息)";
  AiAMapLocationPlatformWidgetController _locationController;

  AiAMapLocationPlatformWidget _aMapWidget;

  String _locationAddress = LOCATION_TIP_DEFAULT;

  String _currentState;
  @override
  void initState() {
    super.initState();

    _locationController = AiAMapLocationPlatformWidgetController(
      locationResultCallback:
          (AiAMapLocationResult locationResult, bool isSuccess) {
        setState(() {
          _currentState = "定位:$isSuccess";
        });

        if (locationResult.haveAddress()) {
          _locationController.stopLocation();
        }
        setState(() {
          if (widget._locationResultTest != null) {
            widget._locationResultTest(locationResult, isSuccess);
          }
          _locationAddress = locationResult.address;
        });

        //添加标记
        _locationController.clearAllOverlay(isKeepMyLocationOverlay: true);
        print("添加：标记");
        _locationController.addMarker(
          latitude: 39.909187,
          longitude: 116.397451,
          title: "天安门",
          snippet: "天安门广场",
        );
      },
      platformViewCreatedCallback: (int id) {
        setState(() {
          //request permission
          requestPermission();
        });
      },
      infoWindowReceiveResultCallback: (InfoWindowConfirmResult result) {
//        setState(() {
//          _locationInfo =
//          "位置点：${result.title},${result.content},${result.latitude},${result.longitude}";
//        });
        print("开始导航");
        _locationController.startNavigatorWidget();
      },
    );
    //map widget
    _aMapWidget = AiAMapLocationPlatformWidget(
      platformWidgetController: _locationController,
    );
  }

  ///
  /// request permission
  /// if granted , show location.
  requestPermission() async {
    if (await Permission.locationAlways.request().isGranted) {
      if (await Permission.storage.request().isGranted) {
        if (await Permission.phone.request().isGranted) {
          if (await Permission.microphone.request().isGranted) {
            //1、ApiKey
            AiAMapLocationPlatformWidgetController.setApiKey(
                apiKey: "f02195a4a4eee61159d73462ceb9032e");
            //2、初始化定位服务
            _locationController..recreateLocationService();
            // Either the permission was already granted before or the user just granted it.
            //"授权成功";
            //显示定位位置
            _locationController.showMyLocationIndicator();
            _locationController.startLocation();
            setState(() {
              _currentState = "开始定位";
            });
          } else {
            //"授权失败";
            setState(() {
              _currentState = "授权失败";
            });
          }
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();

    _locationController.stopLocation();
    _locationController.destroyLocationService();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _aMapWidget,
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 50,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.orange,
                    size: 24,
                  ),
                  padding: EdgeInsets.all(0),
                  tooltip: "重新定位",
                  onPressed: () {
                    requestPermission();
                  },
                ),
                Expanded(
                  child: AirCardListItemTitleHead6Widget(
                    title:
                        "${_locationAddress.isEmpty ? LOCATION_TIP_DEFAULT : _locationAddress}",
                    tooltip: "当前地址",
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.my_location,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    requestPermission();
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    FontAwesome.location_arrow,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    _locationController?.startNavigatorWidget();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

///
/// AirAiAMapLocationType
enum AirAiAMapLocationType {
  summary,
  detail,
}
