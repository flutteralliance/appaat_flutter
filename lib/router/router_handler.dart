import 'package:appaat_flutter/ui/home/home_custom_time.dart';
import 'package:appaat_flutter/ui/refund/customer_refund_detail_page.dart';
import 'package:appaat_flutter/ui/refund/customer_refund_list_page.dart';
import 'package:flutter/material.dart';

///
import 'index_router.dart';

/// page
import 'package:appaat_flutter/ui/home_index_page.dart';

/// create by MZP 2019-08-19 10:09
///
///
///
///

void initDefine(Router router) {
  router.define(getPath("$HomeIndexPage"), handler: homePageHandler);
  router.define(getPath("$CustomerRefundListPage"), handler: refundPageHandler);
  router.define(getPath("$CustomerRefundDetailPage"), handler: refundDetailPageHandler);
  router.define(getPath("$HomeCustomTime"), handler: homeCustomTimeHandler);
}

String getPath(String path) => "${Routers.root}$path";

/// 首页
var homePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeIndexPage();
});

/// 首页-自定义时间
var homeCustomTimeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return HomeCustomTime();
    });


/// 顾客退货
var refundPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CustomerRefundListPage();
});

/// 顾客退货详情
var refundDetailPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String returnOrderId = params["returnOrderId"].first;
  return CustomerRefundDetailPage(returnOrderId);
});


