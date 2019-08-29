import 'dart:async';
import 'dart:convert';
import 'package:appaat_flutter/common/api/result_data.dart';
import 'package:dio/dio.dart';
/// common api
import 'api.dart';
import 'code.dart';
import 'common_result.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/7 8:35 PM
///     desc   : 网络请求工具类
///     version: 1.0
/// </pre>
///

var dio = new Dio();

class NetUtils {
  static void init(HttpOptionsModel options) {
    dio.options.baseUrl = options.baseUrl;
    dio.options.connectTimeout = options.connectTimeout;
    dio.options.receiveTimeout = options.receiveTimeout;
    dio.options.headers = options.headers;
//    dio.options.contentType =
//        ContentType.parse("application/x-www-form-urlencoded");
  }

  static Future get(
      String url, Map<String, dynamic> params, CancelToken cancelToken) async {
    var response;

    if (params != null) {
      response = await dio.get(Api.BASE_URL + url,
          queryParameters: params, cancelToken: cancelToken);
    } else {
      response = await dio.get(Api.BASE_URL + url);
    }
    return response.data;
  }

  static Future<ResultData> post(
      String url, Map<String, dynamic> params, CancelToken cancelToken) async {
    print(
        "\n--------------------------------------------请求start--------------------------------------------\n\n");
    print("请求url：${Api.BASE_URL + url}\n");
    print("请求参数：$params\n");
    Response response;
    try {
      response = await dio.post(Api.BASE_URL + url,
          data: params, cancelToken: cancelToken);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = -2; //NETWORK_TIMEOUT
      }
      print("抛出异常：${e.message}\n");
      print(
          "\n--------------------------------------------请求end--------------------------------------------\n\n");
      return new ResultData(
          Code.errorHandleFunction(errorResponse.statusCode, e.message),
          false,
          errorResponse.statusCode,0);
    }
    print("请求结果：$response\n");
    print(
        "\n--------------------------------------------请求end--------------------------------------------\n\n");
    // 过滤器
    CommonResult result = new CommonResult.fromJson(response.data);
    if (result.code == '200') {
      return new ResultData(result.data, true, int.parse(result.code),result.total);
    } else {
      return new ResultData(result.data, false, int.parse(result.code),result.total);
    }
  }

  ///下载文件
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
      print('downloadFile success---------${response.data}');
    } on DioError catch (e) {
      print('downloadFile error---------$e');
    }
    return response.data;
  }

  ///取消网络请求
  void cancelRequests(CancelToken token) {
    token.cancel();
  }
}

class HttpOptionsModel {
  var baseUrl = "";
  var connectTimeout = 5000;
  var receiveTimeout = 5000;
  Map<String, dynamic> headers;

  HttpOptionsModel(this.baseUrl,
      {this.connectTimeout = 5000, this.receiveTimeout = 5000, this.headers});
}
