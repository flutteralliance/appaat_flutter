import 'package:flutter/widgets.dart';

/// common
import 'app.dart';
import 'api/net_utils.dart';
import 'package:appaat_flutter/common/api/api.dart';
import 'package:appaat_flutter/utils/time_utils.dart';

/// index
import 'package:appaat_flutter/router/index_router.dart';

///
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// create by MZP 2019-08-09 10:56
///
/// 全局配置文件
///
///

class GlobalConfig {
  static void init(BuildContext context, {Router router}) {
    initBaseUrl();
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    App.context = context;
  }

  static void initBaseUrl() {
    NetUtils.init(new HttpOptionsModel(
        "http://v.jspang.com:8088/baixing/",
        connectTimeout: TimeUtils.minutes,
        receiveTimeout: TimeUtils.minutes,
        headers: {
          'accept-language': 'zh-cn',
          'content-type': 'application/json; charset=utf-8',
          'sessionId':
              'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOjF9.Gk6hf4iX_CKm264-o8GWhO4LjIoPtWHdJcppTgaRnEw'
        }));
  }

  static void initRouter(Router router) {
    Routers.initRouters(router);
    App.router = router;
  }
}
