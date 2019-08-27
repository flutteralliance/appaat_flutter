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

const double screenWidth = 750;
const double screenHeight = 1334;

class GlobalConfig {
  static void init(BuildContext context, {Router router}) {
    initBaseUrl();
    ScreenUtil.instance = ScreenUtil(width: screenWidth, height: screenHeight)..init(context);
    App.context = context;
  }

  static void initBaseUrl() {
    NetUtils.init(new HttpOptionsModel("http://v.jspang.com:8088/baixing/",
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
