import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

///
/// 根据业务逻辑进行封装的分页加载组件
class AirCustomRefresh extends StatefulWidget {
  /// 控制器
  final EasyRefreshController controller;

  /// 刷新回调(null为不开启刷新)
  final OnRefreshCallback onRefresh;

  /// 加载回调(null为不开启加载)
  final OnLoadCallback onLoad;

  /// 是否开启控制结束刷新
  final bool enableControlFinishRefresh;

  /// 是否开启控制结束加载
  final bool enableControlFinishLoad;

  /// 任务独立(刷新和加载状态独立)
  final bool taskIndependence;

  /// Header
  final Header header;
  final int headerIndex;

  /// Footer
  final Footer footer;

  /// 子组件构造器
  final EasyRefreshChildBuilder builder;

  /// 子组件
  final Widget child;

  /// 首次刷新
  final bool firstRefresh;

  /// 首次刷新组件
  /// 不设置时使用header
  final Widget firstRefreshWidget;

  /// 空视图
  /// 当不为null时,只会显示空视图
  /// 保留[headerIndex]以上的内容
  final emptyWidget;

  /// 顶部回弹(onRefresh为null时生效)
  final bool topBouncing;

  /// 底部回弹(onLoad为null时生效)
  final bool bottomBouncing;

  /// Slivers集合
  final List<Widget> slivers;

  /// 列表方向
  final Axis scrollDirection;

  /// 反向
  final bool reverse;
  final ScrollController scrollController;
  final bool primary;
  final bool shrinkWrap;
  final Key center;
  final double anchor;
  final double cacheExtent;
  final int semanticChildCount;
  final DragStartBehavior dragStartBehavior;

  final bool isEmpty;

  /// 全局默认Header
  static Header _defaultHeader = ClassicalHeader();
  static set defaultHeader(Header header) {
    if (header != null) {
      _defaultHeader = header;
    }
  }

  /// 全局默认Footer
  static Footer _defaultFooter = ClassicalFooter();
  static set defaultFooter(Footer footer) {
    if (footer != null) {
      _defaultFooter = footer;
    }
  }

  /// 触发时超过距离
  static double callOverExtent = 30.0;

  AirCustomRefresh({
    key,
    this.controller,
    this.onRefresh,
    this.onLoad,
    this.enableControlFinishRefresh = false,
    this.enableControlFinishLoad = false,
    this.taskIndependence = false,
    this.scrollController,
    this.header,
    this.footer,
    this.firstRefresh,
    this.firstRefreshWidget,
    this.headerIndex,
    this.emptyWidget,
    this.isEmpty = true,
    this.topBouncing = true,
    this.bottomBouncing = true,
    @required this.child,
  })  : this.scrollDirection = null,
        this.reverse = null,
        this.builder = null,
        this.primary = null,
        this.shrinkWrap = null,
        this.center = null,
        this.anchor = null,
        this.cacheExtent = null,
        this.slivers = null,
        this.semanticChildCount = null,
        this.dragStartBehavior = null;

  @override
  State<StatefulWidget> createState() {
    return _CustomRefresh();
  }
}

class _CustomRefresh extends State<AirCustomRefresh> {
  Widget _defaultEmptyWidget;
  @override
  Widget build(BuildContext context) {
//    var _screenSize = UiUtil.getScreenSizeOfDp();
//    double _screenWidth = _screenSize.width;
//    double _screenHeight = _screenSize.height;
//    double _emptyContainerWidth = _screenWidth / 2;
//    double _emptyContainerHeight = _screenHeight / 3;
    if (_defaultEmptyWidget == null) {
      _defaultEmptyWidget = GestureDetector(
        onTap: () {
          widget.controller?.callRefresh();
        },
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/images/emp_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Text("数据为空,点击刷新"),
              ],
            ),
          ),
        ),
      );
    }
    return EasyRefresh(
      key: widget.key,
      controller: widget.controller,
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
      enableControlFinishRefresh: widget.enableControlFinishRefresh,
      enableControlFinishLoad: widget.enableControlFinishLoad,
      taskIndependence: widget.taskIndependence,
      scrollController: widget.scrollController,
      header: widget.header ??
          ClassicalHeader(
            refreshText: "下拉刷新",
            refreshedText: "刷新完成",
            refreshingText: "刷新中",
            refreshFailedText: "刷新失败",
            refreshReadyText: "释放刷新",
            textColor: Colors.black,
            infoColor: Colors.black,
            showInfo: false,
          ),
      footer: widget.footer ??
          ClassicalFooter(
            loadText: "上拉加载更多",
            loadReadyText: "释放加载更多",
            loadingText: "加载中",
            loadedText: "加载完成",
            loadFailedText: "加载失败",
            noMoreText: "没有更多数据",
            infoColor: Colors.black,
            textColor: Colors.black,
            showInfo: false,
          ),
      firstRefresh: widget.firstRefresh,
      firstRefreshWidget: widget.firstRefreshWidget,
      headerIndex: widget.headerIndex,
      emptyWidget: widget.isEmpty ? _defaultEmptyWidget : null,
      topBouncing: widget.topBouncing,
      bottomBouncing: widget.bottomBouncing,
      child: widget.child,
    );
  }
}
