import 'package:flutter/material.dart';

/// common
import 'package:appaat_flutter/common/base/base_widget.dart';

///global
import 'package:appaat_flutter/common/global_config.dart';

///res
import 'package:appaat_flutter/res/index_res.dart';

import 'package:appaat_flutter/widget/btn_gradient_red.dart';

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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalConfig.init(context);

    return Material(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/splash_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: loginBody(),
        ),
      ),
    );
  }

  Widget loginBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(child: Divider(height: h(240))),
        Flexible(
          child: Image(
            image: AssetImage("images/2.0x/ic_launcher.png"),
            width: w(230),
            height: h(230),
          ),
        ),
        Flexible(child: Divider(height: h(266))),
        Flexible(child: nameInputView()),
        Flexible(child: pwdInputView()),
        Padding(
          padding: EdgeInsets.only(top: h(120)),
          child: GradientRedButton("登  录", width: 670, height: 88),
        )
      ],
    );
  }

  /// 名称视图
  Widget nameInputView() {
    return Container(
      width: w(670),
      height: h(88),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [ResColors.gray_7f, ResColors.gray_7f]),
          borderRadius: BorderRadius.circular(44)),
      child: Padding(
        padding: const EdgeInsets.only(left: 29),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "请输入手机号码",
              hintStyle:
                  TextStyle(color: ResColors.black_34, fontSize: sp(32))),
          style: TextStyle(color: ResColors.black_34, fontSize: sp(32)),
          keyboardType: TextInputType.phone,
          cursorColor: ResColors.red_e2,
          controller: _nameController,
        ),
      ),
    );
  }

  /// 密码视图
  Widget pwdInputView() {
    return Container(
      width: w(670),
      height: h(88),
      margin: EdgeInsets.only(top: h(20)),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [ResColors.gray_7f, ResColors.gray_7f]),
          borderRadius: BorderRadius.circular(44)),
      child: Padding(
        padding: const EdgeInsets.only(left: 29),
        child: TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "请输入登陆密码",
                hintStyle:
                    TextStyle(color: ResColors.black_34, fontSize: sp(32))),
            style: TextStyle(color: ResColors.black_34, fontSize: sp(32)),
            keyboardType: TextInputType.text,
            cursorColor: ResColors.red_e2,
            controller: _pwdController,
            obscureText: true),
      ),
    );
  }
}
