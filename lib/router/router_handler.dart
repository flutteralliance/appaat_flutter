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
}

String getPath(String path) => "${Routers.root}$path";

/// 首页
var homePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String goodsId = params["goodsId"].first;

  return HomeIndexPage();
});


/// 顾客退货
var refundPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String goodsId = params["goodsId"].first;
      return CustomerRefundListPage();
    });

/// 商品详情
//var goodsDetailsHandler =
//    Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String goodsId = params["goodsId"].first;
//
//  return GoodsDetail(goodsId);
//});

///
