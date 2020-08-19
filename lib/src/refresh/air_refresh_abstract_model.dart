import 'package:flutter/material.dart';

///
/// AbstractModel
///
///
/// 使用示例：
///
///
/// 步骤1：
/// 刷新、加载回调
///      onRefresh: () async {
//        /*
//        刷新
//         */
//        BillHistoryListModel.getInstance().refresh();
//        request();
//      },
//      onLoad: () async {
//        /*
//        加载
//         */
//        BillHistoryListModel.getInstance().loadMore();
//        request();
//      },
///
/// 步骤2：
/// 发送请求
///
///   @override
//  request() {
//    RequestRule requestRule = RequestRule();
//
//    requestRule.parameters = BillHistoryListModel.getInstance().request;
//    _billPresenter.request(requestRule);
//    return null;
//  }
///
/// 步骤3：
/// 响应成功
///
/// Response successful
///
//@override
//requestSuccessful(ResponseModel successfulModel) {
//  /*
//    重置刷新组件的状态，缺少这一步骤将导致"刷新、加载更多操作异常"
//     */
//  _easyRefreshController.resetRefreshState();
//  _easyRefreshController.resetLoadState();
//
//  setState(() {
//    //新数据
//    BillHistoryListModel.getInstance().responseSuccessful(
//      newList: successfulModel.data['data']['list'],
//      total: successfulModel.data['data']['total'],
//      page: successfulModel.data['data']['page'],
//      size: successfulModel.data['data']['size'],
//      refreshSuccessful: (bool noMore) {
//        /*
//          刷新成功
//           */
//        _easyRefreshController.finishRefresh(
//          success: true,
//          noMore: noMore,
//        );
//      },
//      loadMoreSuccessful: (bool noMore) {
//        /*
//          加载更多
//           */
//        _easyRefreshController.finishLoad(
//          success: true,
//          noMore: noMore,
//        );
//      },
//    );
//  });
//
//  return null;
//}

///
/// 步骤4：
/// 响应失败
///
/// Response failure!
///   @override
//  requestFailure(ResponseModel failureModel) {
//    /*
//    Failure
//     */
//    BillHistoryListModel.getInstance().responseFailure(
//      refreshFailure: () {
//        /*
//        刷新失败
//        */
//        _easyRefreshController.finishRefresh(
//          success: false,
//        );
//      },
//      loadMoreFailure: () {
//        /*
//        加载更多失败
//        */
//        _easyRefreshController.finishLoad(success: false);
//      },
//    );
//    return null;
//  }
///
class AirRefreshAbstractModel extends ChangeNotifier {
  ///
  /// 请求参数（向服务器发送请求的参数）
  Map<String, Object> _request = {
    //页码，从1开始
    "page": 1,
    //条数 web server Default value : 20
    "size": 10,
  };

  ///
  /// 响应数据（存储着已定的事实数据）
  Map<String, Object> _response = {
    ///
    /// 服务器存储的数据总数量（默认为0）
    "total": 0,

    ///
    /// 响应数据所在的页码（默认为1）
    "page": 1,

    ///
    /// 响应数据所在的页码的个数（默认为10）
    "size": 10,
  };

  ///
  /// 缓存区（用于缓存上次请求参数的数据，以便可及时恢复到上一次状态）
  Map<String, Object> _cachedRequest = {
    "page": 1,
    "size": 10,
  };

  List _list = [];

  List _newList = [];

  ///
  /// 此字段在现有封装体系中没有用到！
  /// 此字段的意义取决于开发者在具体不同业务情况下，对其赋予的意义
  bool _refreshOnVisible = false;

  set refreshOnVisible(bool refreshOnVisible) {
    this._refreshOnVisible = refreshOnVisible;
  }

  get refreshOnVisible => this._refreshOnVisible;

  ///
  /// 当前对象列表数据的总和数据
  List get list => this._list;

  ///
  /// 当前列表新增的数据
  List get newList => this._newList;

  get total => this._response['total'];
  get size => this._response['size'];
  get page => this._response['page'] ?? requestPage;

  set total(int total) {
    this._response['total'] = total;
  }

  set size(int size) {
    this._response['size'] = size;
  }

  set page(int page) {
    this._response['page'] = page;
  }

  ///
  /// 重制请求数据为缓存的最近一次的状态
  _resetRequestByCache() {
    _request['page'] = _cachedRequest['page'];
    _request['size'] = _cachedRequest['size'];
  }

  ///
  /// 缓存请求数据
  _cacheRequest() {
    _cachedRequest['page'] = _request['page'];
    _cachedRequest['size'] = _request['size'];
  }

  ///
  /// 开始：刷新、加载更多操作事件
  _refreshAndLoadMoreEventStart() {
    //在开始：刷新、加载更多操作事件时，要备份一份数据
    _cacheRequest();
  }

  ///
  /// 失败：刷新、加载更多操作事件
  _refreshAndLoadMoreEventFailure() {
    //在失败：刷新、加载更多操作事件之后，要恢复数据
    _resetRequestByCache();
  }

  ///
  /// 刷新操作
  refresh() {
    /*
    备份数据
     */
    _refreshAndLoadMoreEventStart();
    /*
    设置：刷新页码
     */
    requestPage = 1;
  }

  ///
  /// 加载更多操作
  loadMore() {
    /*
    备份数据
     */
    _refreshAndLoadMoreEventStart();
    /*
    设置：加载页码
     */
    requestPage++;
  }

  ///
  /// 响应成功
  responseSuccessful({
    @required List newList,
    @required int total,
    @required int page,
    @required int size,
    @required refreshSuccessful(bool noMore),
    @required loadMoreSuccessful(bool noMore),
  }) {
    /*
    将响应成功的"分页流程数据"存储起来
     */
    newListWithRefresh = newList;
    this.total = total;
    this.page = page;
    this.size = size;

    /*
    判断是：刷新操作，还是加载更多操作
     */
    if (_isRefresh()) {
      /*
      是：刷新，则回调刷新
       */
      refreshSuccessful(_isNoMoreData());
    } else {
      /*
      是：加载更多，则回调加载
       */
      loadMoreSuccessful(_isNoMoreData());
    }
  }

  ///
  /// 响应失败
  responseFailure({@required refreshFailure(), @required loadMoreFailure()}) {
    /*
    恢复上次备份的数据
     */
    _refreshAndLoadMoreEventFailure();

    /*
    判断是：刷新操作，还是加载更多操作
     */
    if (_isRefresh()) {
      /*
      是：刷新，则回调刷新
       */
      refreshFailure();
    } else {
      /*
      是：加载更多，则回调加载
       */
      loadMoreFailure();
    }
  }

  ///
  /// 请求参数
  Map<String, Object> get request => this._request;

  int get requestPage => this._request['page'];
  int get requestSize => this._request['size'];

  set requestPage(int page) {
    this._request['page'] = page;
  }

  set requestSize(int size) {
    this._request['size'] = size;
  }

  set newList(List newList) {
    //新增数据
    this._newList = newList;
    //存储新增数据到总数据中
    this._list.addAll(newList);
  }

  ///
  /// 新增数据，并处理刷新机制
  set newListWithRefresh(List newList) {
    this._newList = newList;
    if (_isRefresh()) {
      /*
      刷新操作
       */
      this._list.clear();
      this._list.addAll(newList);
    } else {
      /*
      加载更多操作
       */
      this._list.addAll(newList);
    }
  }

  bool _isRefresh() {
    return requestPage == 1;
  }

  bool _isLoadMore() {
    return !_isRefresh();
  }

  ///
  /// 是否：有更多的数据等待加载
  bool _isHaveMoreData() {
    if (page * size >= total) {
      //没有更多数据
      return false;
    } else {
      //还有未加载的数据
      return true;
    }
  }

  ///
  /// 是否：没有数据等待加载
  bool _isNoMoreData() {
    return !_isHaveMoreData();
  }

  addAll(List list) {
    _list.addAll(list);
  }

  clear() {
    this._list.clear();
  }

  isEmpty() {
    return (list == null || list?.length == 0);
  }

  notify() {
    notifyListeners();
  }
}
