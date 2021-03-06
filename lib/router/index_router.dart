export 'package:fluro/fluro.dart';
///
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
/// page
import 'package:appaat_flutter/widget/layout/error_page.dart';
/// router
//import 'package:appaat_flutter/router/router_path.dart';
import 'router_handler.dart';

/// create by MZP 2019-08-19 10:07
///
/// 配置路由
///
///

class Routers {
  static String root = "/";
//  static String pagesDetail = "/detail";
//  static String pagesError = "/error";

  static void initRouters(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
          return ErrorPage();
        });
    //
    initDefine(router);
  }

}
