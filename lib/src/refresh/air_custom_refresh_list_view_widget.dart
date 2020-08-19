import 'package:air_design/src/ui/air_list_view_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'air_custom_refresh.dart';
import 'air_refresh_abstract_model.dart';

typedef CustomRefreshCallback = void Function();

///
/// AirCustomRefreshListViewWidget
/// [AirRefreshAbstractModel]
/// [AirCustomRefreshListViewController]
/// [AirRefreshCommonModel]
class AirCustomRefreshListViewWidget<T extends AirRefreshAbstractModel>
    extends StatefulWidget {
  List<dynamic> _list;
  T _refreshModel;
  CustomRefreshCallback _callback;
  AirCustomRefreshListViewController _controller;
  IndexedWidgetBuilder _indexedWidgetBuilder;
  AirCustomRefreshListViewWidget.defaultStyle({
    @required AirCustomRefreshListViewController controller,
    @required List list,
    @required T refreshModel,
    @required CustomRefreshCallback callback,
    @required IndexedWidgetBuilder widgetBuilder,
  }) {
    _controller = controller;
    _list = list;
    _refreshModel = refreshModel;
    _callback = callback;
    _indexedWidgetBuilder = widgetBuilder;
  }

  @override
  _AirCustomRefreshListViewWidgetState createState() =>
      _AirCustomRefreshListViewWidgetState();
}

class _AirCustomRefreshListViewWidgetState
    extends State<AirCustomRefreshListViewWidget> {
  EasyRefreshController _easyRefreshController;
  @override
  void initState() {
    super.initState();
    //must init controller
    widget._controller.init(state: this);
    /*
    Create instance.
     */
    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    super.dispose();
    /*
    Release
     */
    _easyRefreshController.dispose();
    _easyRefreshController = null;
  }

  @override
  Widget build(BuildContext context) {
    return AirCustomRefresh(
      firstRefresh: true,
      controller: _easyRefreshController,
      isEmpty: _isEmpty(widget._list),
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      child: AirListViewFactory.createListViewBuilder(
        itemCount: widget._list.length,
        itemBuilder: widget._indexedWidgetBuilder,
      ),
      onRefresh: () async {
        //refresh
        widget._refreshModel.refresh();
        widget._callback();
      },
      onLoad: () async {
        //loadMore
        widget._refreshModel.loadMore();
        widget._callback();
      },
    );
  }

  bool _isEmpty(List list) {
    if (list == null) {
      return true;
    }
    return list.isEmpty;
  }

  ///
  /// Refresh/LoadMore Failure
  _callRequestFailureState() {
    //fail
    widget._refreshModel.responseFailure(
      refreshFailure: () {
        //刷新失败
        _easyRefreshController.finishRefresh(
          success: false,
          noMore: false,
        );
      },
      loadMoreFailure: () {
        //加载更多失败
        _easyRefreshController.finishLoad(
          success: false,
          noMore: false,
        );
      },
    );
  }

  ///
  /// Refresh/LoadMore Successful
  _callRequestSuccessfulState({
    @required List newList,
    @required num total,
    @required num page,
    @required num size,
  }) {
    //重置刷新组件的状态，缺少这一步骤将导致"刷新、加载更多操作异常
    _easyRefreshController.resetRefreshState();
    _easyRefreshController.resetLoadState();
    //success
    widget._refreshModel.responseSuccessful(
      newList: newList,
      total: total,
      page: page,
      size: size,
      refreshSuccessful: (bool noMore) {
        //刷新成功
        _easyRefreshController.finishRefresh(
          success: true,
          noMore: false,
        );
      },
      loadMoreSuccessful: (bool noMore) {
        //加载更多
        _easyRefreshController.finishLoad(
          success: true,
          noMore: noMore,
        );
      },
    );
  }
}

///
/// AirCustomRefreshListViewController
class AirCustomRefreshListViewController {
  _AirCustomRefreshListViewWidgetState _state;

  init({
    @required _AirCustomRefreshListViewWidgetState state,
  }) {
    assert(state != null);
    _state = state;
  }

  ///
  /// Refresh/LoadMore Failure
  callRequestFailureState() {
    _state._callRequestFailureState();
  }

  ///
  /// Refresh/LoadMore Successful
  callRequestSuccessfulState({
    @required List newList,
    @required num total,
    @required int page,
    @required int size,
  }) {
    _state._callRequestSuccessfulState(
      newList: newList,
      total: total,
      page: page,
      size: size,
    );
  }
}

class AirRefreshCommonModel extends AirRefreshAbstractModel {}
