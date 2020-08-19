import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:air_design/src/file/shared_preferences_manager.dart';
import 'package:airoute/airoute.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

export 'package:dio/dio.dart';

typedef ResponseSuccessCallback = void Function(ResponseModel);
typedef ResponseErrorCallback = void Function(ResponseModel);

///
/// HttpManager
/// [initGlobal]
class HttpManager {
  static const CONNECT_TIME_OUT_DEFAULT = 10000;
  static const RECEIVE_TIME_OUT_DEFAULT = 10000;
  static HttpManager _instance;
  String _baseUrl;
  int _connectTimeOut;
  int _receiveTimeOut;

  Dio _dio;

  HttpManager._();

  static HttpManager instance() {
    if (_instance == null) {
      _instance = HttpManager._();
    }
    return _instance;
  }

  void initGlobal({
    @required String baseUrl,
    int connectTimeOut = CONNECT_TIME_OUT_DEFAULT,
    int receiveTimeOut = RECEIVE_TIME_OUT_DEFAULT,
  }) {
    //init global config
    _baseUrl = baseUrl;
    _connectTimeOut = connectTimeOut;
    _receiveTimeOut = receiveTimeOut;
    //instance
    _dio = _initDio();
    _dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
    _addInterceptor(_dio);
  }

  Dio _initDio() {
    // or new Dio with a BaseOptions instance.
    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeOut,
      receiveTimeout: _receiveTimeOut,
    );
    Dio dio = new Dio(options);
    return dio;
  }

  _addInterceptor(Dio dio) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Do something before request is sent
      print('send request：path:${options.path}，baseURL:${options.baseUrl}');

      //测试-start
//      String replaced = options.path.replaceFirst("/apis/tms", "");
//      options.path = replaced;
      //测试-end
      String token = await SharedPreferencesManager.instance().getToken();
      print("token : $token");
      if (token == null || token.isEmpty) {
        print("no token，request token firstly...");
//        Airoute.pushNamedAndRemoveUntil(newRouteName: "/LoginPage");
        //lock the dio.
        //刷新Token
//        dio.lock();
//        return tokenDio.get("/token").then((d) {
//          options.headers["csrfToken"] = csrfToken = d.data['data']['token'];
//          print("request token succeed, value: " + d.data['data']['token']);
//          print(
//              'continue to perform request：path:${options.path}，baseURL:${options.path}');
//          return options;
//        }).whenComplete(() => dio.unlock()); // unlock the dio
      } else {
        options.headers["authorization"] = token;
//        return options;
      }
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      return e; //continue
    }));
  }

  void get<T>({
    @required String suffixUrl,
    Map<String, dynamic> queryParameters,
    ResponseCallback responseCallback,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.get(suffixUrl,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      _response(
        response: response,
        responseCallback: responseCallback,
        error: null,
      );
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      _response(
        response: null,
        responseCallback: responseCallback,
        error: e,
      );
    }
//    print(object)
  }

  void post({
    @required String suffixUrl,
    ResponseCallback responseCallback,
    Options options,
    data,
  }) async {
    try {
      Response response = await _dio.post(
        suffixUrl,
        options: options,
        data: data,
      );

      _response(
        response: response,
        responseCallback: responseCallback,
        error: null,
      );
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      _response(
        response: null,
        responseCallback: responseCallback,
        error: e,
      );
    }
  }

  void put({
    @required String suffixUrl,
    ResponseCallback responseCallback,
    Options options,
    data,
  }) async {
    try {
      Response response = await _dio.put(
        suffixUrl,
        options: options,
        data: data,
      );

      _response(
        response: response,
        responseCallback: responseCallback,
        error: null,
      );
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      _response(
        response: null,
        responseCallback: responseCallback,
        error: e,
      );
    }
  }

  _response({
    @required Response response,
    @required ResponseCallback responseCallback,
    @required DioError error,
  }) {
    if (error == null && response != null) {
      int statusCodeNetLevel = response.statusCode;
      print("""
      **************************************************************************
      Response: 
      ${response.toString()}
      
      **************************************************************************
      """);
      ResponseModel responseModel = ResponseModel();
      responseModel.statusCodeNetLevel = statusCodeNetLevel;
      responseModel.statusMsgNetLevel = response.statusMessage;
      if (statusCodeNetLevel == 200) {
        //Net level success
        dynamic businessData = response.data;
        responseModel.data = businessData;
        String statusCodeBusinessLevelString =
            businessData['code'] ?? "${businessData['status']}";
        int statusCodeBusinessLevel = int.parse(statusCodeBusinessLevelString);
        String statusMsgBusinessLevel = businessData['message'];
        //add to model
        responseModel.statusCodeBusinessLevel = statusCodeBusinessLevel;
        responseModel.statusMsgBusinessLevel = statusMsgBusinessLevel;

        if (statusCodeBusinessLevel == 200) {
          //Business level success
          responseCallback?.successCallback(responseModel);
        } else {
          Airoute.push(
              route: AwesomeMessageRoute(
                  theme: null,
                  awesomeMessage: AwesomeHelper.createAwesome(
                    tipType: TipType.ERROR,
                    title: "华润司机端提示您：",
                    message: responseModel.statusMsgBusinessLevel,
                  )));
          //Business level error
          responseCallback?.errorCallback(responseModel);
        }
      } else {
        Airoute.push(
            route: AwesomeMessageRoute(
                theme: null,
                awesomeMessage: AwesomeHelper.createAwesome(
                  tipType: TipType.ERROR,
                  title: "华润司机端提示您：",
                  message: responseModel.statusMsgBusinessLevel,
                )));
        //Net level error
        responseCallback?.errorCallback(responseModel);
      }
    } else {
      print(error.response);
      ResponseModel errorResponseModel = ResponseModel();
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          errorResponseModel.statusMsgNetLevel = "网络连接超时";
          errorResponseModel.statusMsgBusinessLevel = "网络连接超时";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorResponseModel.statusMsgNetLevel = "数据发送超时";
          errorResponseModel.statusMsgBusinessLevel = "数据发送超时";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorResponseModel.statusMsgNetLevel = "数据接收超时";
          errorResponseModel.statusMsgBusinessLevel = "数据接收超时";
          break;
        case DioErrorType.RESPONSE:
          var errorResponse = error.response;

          int errorCode = errorResponse.statusCode;
          String errorMessage = errorResponse.statusMessage;
          if (errorCode > 400 && errorCode < 402) {
            errorResponseModel.statusMsgNetLevel = "用户身份过期";
            errorResponseModel.statusMsgBusinessLevel = "用户身份过期，请重新登录";
            //退出登录状态
            SharedPreferencesManager.instance().clearToken();
            Airoute.pushNamedAndRemoveUntil(newRouteName: "/LoginPage");
          }

          break;
        case DioErrorType.CANCEL:
          break;
        case DioErrorType.DEFAULT:
          errorResponseModel.statusMsgNetLevel = "服务器异常，请稍后重试!";
          errorResponseModel.statusMsgBusinessLevel = "服务器异常，请稍后重试!";
          break;
      }
      Airoute.push(
          route: AwesomeMessageRoute(
              theme: null,
              awesomeMessage: AwesomeHelper.createAwesome(
                tipType: TipType.ERROR,
                title: "华润司机端提示您：",
                message: errorResponseModel.statusMsgBusinessLevel,
              )));
      responseCallback?.errorCallback(errorResponseModel);
    }
  }
}

class ResponseModel {
  int statusCodeNetLevel;
  int statusCodeBusinessLevel;
  String statusMsgNetLevel;
  String statusMsgBusinessLevel;

  dynamic data;
}

class ResponseCallback {
  ResponseSuccessCallback _successCallback;
  ResponseErrorCallback _errorCallback;

  ///
  /// Constructor
  ResponseCallback(
      {@required ResponseSuccessCallback successCallback,
      @required ResponseErrorCallback errorCallback}) {
    _successCallback = successCallback;
    _errorCallback = errorCallback;
  }

  ResponseSuccessCallback get successCallback => _successCallback;
  ResponseErrorCallback get errorCallback => _errorCallback;
}
