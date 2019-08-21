import 'package:flutter/material.dart';

/// common
import 'package:appaat_flutter/common/base/base_widget.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/20 2:38 PM
///     desc   : 登录页面
///     version: 1.0
/// </pre>
///
class LoginPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends BaseState<LoginPage> {
  @override
  Widget build(BuildContext context) {
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

  Widget loginBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            image: AssetImage("images/ic_launcher.png"),
            width: 300,
            height: 300,
          )
        ],
      ),
    );
  }
}
