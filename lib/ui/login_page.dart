import 'package:flutter/material.dart';
import 'package:appaat_flutter/base/base_stateful_widget.dart';
import 'package:appaat_flutter/utils/flutter_screenutil.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/20 2:38 PM
///     desc   : 登录页面
///     version: 1.0
/// </pre>
///
// ignore: must_be_immutable
class LoginPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return new LoginPageState();
  }
}

class LoginPageState extends BaseWidgetState<LoginPage> {
  @override
  Widget buildWidget(BuildContext context) {
    ///屏幕适配方案 默认 width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/splash_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: loginBody(),
    );
  }

  @override
  void onCreate() {}

  @override
  void onDestroy() {}

  Widget loginBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            image: AssetImage("images/ic_launcher.png"),
            width: screenUtil.setWidth(300),
            height: screenUtil.setHeight(300),
          )
        ],
      ),
    );
  }
}
