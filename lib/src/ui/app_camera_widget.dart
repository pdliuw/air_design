//import 'dart:io';
//
//import 'package:camera/camera.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:video_player/video_player.dart';
//
//import 'app_card_multiple_picture_widget.dart';
//import 'app_circle_button_widget.dart';
//
//typedef CameraPreviewCallback = void Function(List<String> filePathList);
//
/////
///// AppCameraWidget
//class AppCameraWidget extends StatefulWidget {
//  CameraPreviewCallback _onTapPreview;
//
//  ///
//  /// constructor
//  AppCameraWidget({
//    CameraPreviewCallback onTapPreview,
//  }) {
//    _onTapPreview = onTapPreview;
//  }
//  @override
//  State<StatefulWidget> createState() {
//    return _CameraState();
//  }
//}
//
/////
///// _CameraState
///// [onTakePictureButtonPressed]
///// [takePicture]
//class _CameraState extends State<AppCameraWidget> with WidgetsBindingObserver {
//  CameraController _cameraController;
//  List<String> _imagePathList = [];
//  String imagePath;
//  String videoPath;
//  VideoPlayerController videoController;
//  VoidCallback videoPlayerListener;
//  List<CameraDescription> cameras = [];
//
//  @override
//  void initState() {
//    super.initState();
//    WidgetsBinding.instance.addObserver(this);
//    a();
//  }
//
//  a() async {
//    cameras = await availableCameras();
//    for (CameraDescription description in cameras) {
//      if (description.lensDirection == CameraLensDirection.back) {
//        onNewCameraSelected(description);
//      }
//    }
//
//    setState(() {});
//  }
//
//  @override
//  void dispose() {
//    WidgetsBinding.instance.removeObserver(this);
//    super.dispose();
//  }
//
//  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    // App state changed before we got the chance to initialize.
//    if (_cameraController == null || !_cameraController.value.isInitialized) {
//      return;
//    }
//    if (state == AppLifecycleState.inactive) {
//      _cameraController?.dispose();
//    } else if (state == AppLifecycleState.resumed) {
//      if (_cameraController != null) {
//        onNewCameraSelected(_cameraController.description);
//      }
//    }
//  }
//
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: _scaffoldKey,
//      appBar: null,
//      body: Column(
//        children: <Widget>[
//          Container(
//            child: _cameraPreviewWidget(),
//            decoration: BoxDecoration(
//              color: Colors.green,
//              border: Border.all(
//                color: _cameraController != null &&
//                        _cameraController.value.isRecordingVideo
//                    ? Colors.redAccent
//                    : Colors.grey,
//                width: 3.0,
//              ),
//            ),
//          ),
//          Expanded(
//            child: Stack(
//              children: <Widget>[
//                Align(
//                  child: _thumbnailWidget(),
//                  alignment: Alignment.centerLeft,
//                ),
//                Align(
//                  child: _captureControlRowWidget(),
//                  alignment: Alignment.center,
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  /// Display the preview from the camera (or a message if the preview is not available).
//  Widget _cameraPreviewWidget() {
//    if (_cameraController == null || !_cameraController.value.isInitialized) {
//      return const Text(
//        'Tap a camera',
//        style: TextStyle(
//          color: Colors.white,
//          fontSize: 24.0,
//          fontWeight: FontWeight.w900,
//        ),
//      );
//    } else {
//      return AspectRatio(
//        aspectRatio: _cameraController.value.aspectRatio,
//        child: CameraPreview(_cameraController),
//      );
//    }
//  }
//
//  /// Display the thumbnail of the captured image or video.
//  Widget _thumbnailWidget() {
//    return Align(
//      alignment: Alignment.centerLeft,
//      child: Row(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          videoController == null && imagePath == null
//              ? Container()
//              : AppCardMultiplePictureWidget.defaultStyle(
//                  onTap: () {
//                    widget._onTapPreview(_imagePathList);
//                  },
//                  picturePathList: _imagePathList,
//                ),
//        ],
//      ),
//    );
//  }
//
//  /// Display the control bar with buttons to take pictures and record videos.
//  Widget _captureControlRowWidget() {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      mainAxisSize: MainAxisSize.max,
//      children: <Widget>[
//        AppCircleButtonWidget.defaultStyle(
//          onTapUp: _cameraController != null &&
//                  _cameraController.value.isInitialized &&
//                  !_cameraController.value.isRecordingVideo
//              ? onTakePictureButtonPressed
//              : null,
//        ),
//      ],
//    );
//  }
//
//  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
//
//  void showInSnackBar(String message) {
//    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
//  }
//
//  void onNewCameraSelected(CameraDescription cameraDescription) async {
//    if (_cameraController != null) {
//      await _cameraController.dispose();
//    }
//    _cameraController = CameraController(
//      cameraDescription,
//      ResolutionPreset.medium,
//      enableAudio: false,
//    );
//
//    // If the controller is updated then update the UI.
//    _cameraController.addListener(() {
//      if (mounted) setState(() {});
//      if (_cameraController.value.hasError) {
//        showInSnackBar(
//            'Camera error ${_cameraController.value.errorDescription}');
//      }
//    });
//
//    try {
//      await _cameraController.initialize();
//    } on CameraException catch (e) {
//      _showCameraException(e);
//    }
//
//    if (mounted) {
//      setState(() {});
//    }
//  }
//
//  void onTakePictureButtonPressed() {
//    takePicture().then((String filePath) {
//      if (mounted) {
//        setState(() {
//          //save file path to container
//          _imagePathList.add(filePath);
//          imagePath = filePath;
//          videoController?.dispose();
//          videoController = null;
//        });
////        if (filePath != null) showInSnackBar('Picture saved to $filePath');
//      }
//    });
//  }
//
//  void onVideoRecordButtonPressed() {
//    startVideoRecording().then((String filePath) {
//      if (mounted) setState(() {});
//      if (filePath != null) showInSnackBar('Saving video to $filePath');
//    });
//  }
//
//  void onStopButtonPressed() {
//    stopVideoRecording().then((_) {
//      if (mounted) setState(() {});
//      showInSnackBar('Video recorded to: $videoPath');
//    });
//  }
//
//  void onPauseButtonPressed() {
//    pauseVideoRecording().then((_) {
//      if (mounted) setState(() {});
//      showInSnackBar('Video recording paused');
//    });
//  }
//
//  void onResumeButtonPressed() {
//    resumeVideoRecording().then((_) {
//      if (mounted) setState(() {});
//      showInSnackBar('Video recording resumed');
//    });
//  }
//
//  Future<String> startVideoRecording() async {
//    if (!_cameraController.value.isInitialized) {
//      showInSnackBar('Error: select a camera first.');
//      return null;
//    }
//
//    final Directory extDir = await getApplicationDocumentsDirectory();
//    final String dirPath = '${extDir.path}/Movies/flutter_test';
//    await Directory(dirPath).create(recursive: true);
//    final String filePath = '$dirPath/${timestamp()}.mp4';
//
//    if (_cameraController.value.isRecordingVideo) {
//      // A recording is already started, do nothing.
//      return null;
//    }
//
//    try {
//      videoPath = filePath;
//      await _cameraController.startVideoRecording(filePath);
//    } on CameraException catch (e) {
//      _showCameraException(e);
//      return null;
//    }
//    return filePath;
//  }
//
//  Future<void> stopVideoRecording() async {
//    if (!_cameraController.value.isRecordingVideo) {
//      return null;
//    }
//
//    try {
//      await _cameraController.stopVideoRecording();
//    } on CameraException catch (e) {
//      _showCameraException(e);
//      return null;
//    }
//
//    await _startVideoPlayer();
//  }
//
//  Future<void> pauseVideoRecording() async {
//    if (!_cameraController.value.isRecordingVideo) {
//      return null;
//    }
//
//    try {
//      await _cameraController.pauseVideoRecording();
//    } on CameraException catch (e) {
//      _showCameraException(e);
//      rethrow;
//    }
//  }
//
//  Future<void> resumeVideoRecording() async {
//    if (!_cameraController.value.isRecordingVideo) {
//      return null;
//    }
//
//    try {
//      await _cameraController.resumeVideoRecording();
//    } on CameraException catch (e) {
//      _showCameraException(e);
//      rethrow;
//    }
//  }
//
//  Future<void> _startVideoPlayer() async {
//    final VideoPlayerController vcontroller =
//        VideoPlayerController.file(File(videoPath));
//    videoPlayerListener = () {
//      if (videoController != null && videoController.value.size != null) {
//        // Refreshing the state to update video player with the correct ratio.
//        if (mounted) setState(() {});
//        videoController.removeListener(videoPlayerListener);
//      }
//    };
//    vcontroller.addListener(videoPlayerListener);
//    await vcontroller.setLooping(true);
//    await vcontroller.initialize();
//    await videoController?.dispose();
//    if (mounted) {
//      setState(() {
//        imagePath = null;
//        videoController = vcontroller;
//      });
//    }
//    await vcontroller.play();
//  }
//
//  Future<String> takePicture() async {
//    if (!_cameraController.value.isInitialized) {
//      showInSnackBar('Error: select a camera first.');
//      return null;
//    }
//    final Directory extDir = await getApplicationDocumentsDirectory();
//    final String dirPath = '${extDir.path}/Pictures/flutter_scmSafe';
//    await Directory(dirPath).create(recursive: true);
//    final String filePath = '$dirPath/${timestamp()}.jpg';
//
//    if (_cameraController.value.isTakingPicture) {
//      // A capture is already pending, do nothing.
//      return null;
//    }
//
//    try {
//      await _cameraController.takePicture(filePath);
//    } on CameraException catch (e) {
//      _showCameraException(e);
//      return null;
//    }
//    return filePath;
//  }
//
//  void _showCameraException(CameraException e) {
//    logError(e.code, e.description);
//    showInSnackBar('Error: ${e.code}\n${e.description}');
//  }
//
//  /// Returns a suitable camera icon for [direction].
//  IconData getCameraLensIcon(CameraLensDirection direction) {
//    switch (direction) {
//      case CameraLensDirection.back:
//        return Icons.camera_rear;
//      case CameraLensDirection.front:
//        return Icons.camera_front;
//      case CameraLensDirection.external:
//        return Icons.camera;
//    }
//    throw ArgumentError('Unknown lens direction');
//  }
//
//  void logError(String code, String message) =>
//      print('Error: $code\nError Message: $message');
//}
