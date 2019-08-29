import 'package:appaat_flutter/common/base/base_function.dart';
import 'package:appaat_flutter/widget/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
import 'home_index_page.dart';

/// common
import 'package:appaat_flutter/common/base/base_widget.dart';

///global
import 'package:appaat_flutter/common/global_config.dart';

///res
import 'package:appaat_flutter/res/index_res.dart';

import 'package:appaat_flutter/widget/btn_gradient_red.dart';
import 'package:appaat_flutter/utils/shared_preferences.dart';
import 'package:appaat_flutter/utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:appaat_flutter/utils/md5_util.dart';
import 'package:dio/dio.dart';
import 'package:appaat_flutter/entry/login_entity.dart';
import 'package:appaat_flutter/entry/store_entity.dart';
import 'package:appaat_flutter/utils/route_util.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/20 2:38 PM
///     desc   : 登录页面 CloudPushService未绑定
///     version: 1.0
/// </pre>
///
// ignore: must_be_immutable
class LoginPage extends BaseStatefulWidget {
  String id;
  String jumpType;

  @override
  State<StatefulWidget> createState() => LoginPageState(id, jumpType);

  LoginPage(this.id, this.jumpType);
}

class LoginPageState extends BaseState<LoginPage> with BaseFunction {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  CancelToken _cancelToken = CancelToken();

  ///分享进入或者推送进入判断
  String id;
  String jumpType;

  ///进度条是否显示
  bool isShowLoading = false;

  ///更新页面状态
  State state;

  ///页面是否存活
  bool isLiveActivity = false;

  ///页面宽高
  double pageW = 0, pageH = 0;

  LoginPageState(this.id, this.jumpType);

  @override
  void initState() {
    isLiveActivity = true;
    state = this;
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    GlobalConfig.init(context);
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Container(
              width: pageW,
              height: pageH,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/splash_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: loginBody(),
            ),
          ),
          loadingViewWidget(isShowLoading, ScreenUtil.getInstance())
        ],
      ),
    );
  }

  ///校验是否登录
  checkLogin() async {
    var sp = await SpUtil.getInstance();
    bool isLogin = null != sp.getBool(SpUtil.IS_LOGIN)
        ? sp.getBool(SpUtil.IS_LOGIN)
        : false;
    print("isLogin:$isLogin");
    String modules = sp.getString(SpUtil.moduleCodeList);
    bool isAdmin = sp.getBool(SpUtil.isAdmin);
    //全局赋值
    Constants.getInstance().setStoreNo(sp.getString(SpUtil.STORE_NO));
    Constants.isAdmin = isAdmin;
    Constants.getInstance().setUserId(sp.getInt(SpUtil.userId));
    Constants.getInstance().setRoleName(sp.getString(SpUtil.roleName));
    Constants.getInstance().setRoleDesc(sp.getString(SpUtil.roleDesc));
    if (isLogin) {
      intoActivity(modules, isAdmin);
    }else{
      setState(() {
        pageH = double.infinity;
        pageW = double.infinity;
      });
    }
  }

  ///跳转页面判断
  intoActivity(String modules, bool isAdmin) {
    getStoreInfoNet();
    var params = {"jumpType": jumpType, "id": id};
    startActivityFinish(context, HomeIndexPage());
//    if (null != jumpType && "" != jumpType && "INDEX" != jumpType) {
//      navigateTo(context, '$HomeIndexPage', params: params);
//    } else {
//      if (isAdmin) {
//        //管理员
//        navigateTo(context, 'BossHomeChartAct', params: params);
//      } else {
//        if (modules.contains(",")) {
//          if (modules.contains("/toolIndex,")) {
//            //老板看板
//            navigateTo(context, 'BossHomeChartAct', params: params);
//          } //店员看板
//          else if (modules.contains("/toolIndex/dianzhangshouye")) {
//            navigateTo(context, 'HomeChartAct', params: params);
//          } //店员权限 - 工作台
//          else {
//            navigateTo(context, '$HomeIndexPage', params: params);
//          }
//        } else {
//          if (modules.contains("/toolIndex")) {
//            //老板看板
//            navigateTo(context, 'BossHomeChartAct', params: params);
//          } //店员看板
//          else if (modules.contains("/toolIndex/dianzhangshouye")) {
//            navigateTo(context, 'HomeChartAct', params: params);
//          } //店员权限 - 工作台
//          else {
//            navigateTo(context, '$HomeIndexPage', params: params);
//          }
//        }
//      }
//    }
  }

  ///登录校验
  onClickLogin() {
//    String _name = _nameController.text;
//    String _pwd = _pwdController.text;
    String _name = '18141924293';
    String _pwd = '123456';

    if (_name.toString().isEmpty) {
      Fluttertoast.showToast(msg: "手机号码不能为空");
      return;
    }
    if (_name.length != 11) {
      Fluttertoast.showToast(msg: "请输入正确的手机号码");
      return;
    }
    if (_pwd.toString().isEmpty) {
      Fluttertoast.showToast(msg: "密码不能为空");
      return;
    }
    loginNet(_pwd, _name);
  }

  ///登录请求
  loginNet(String pwd, String name) async {
    showLoading();
    String md5Pwd = Md5Util.generateMd5(pwd);
    var request = {
      "data": {"name": name, "password": md5Pwd, "actionType": "tool"}
    };
    ResultData result =
        await NetUtils.post(Api.LOGIN_URL, request, _cancelToken);
    if (result.result) {
      //登录成功
      LoginEntity loginEntity = LoginEntity.fromJson(result.data);
      saveLoginInfoToLocal(loginEntity, name);
      intoActivity(loginEntity.moduleCodeList.toString(), loginEntity.isAdmin);
    } else {
      //登录失败
      show("登录失败,请稍候重试");
    }
    hideLoading();
  }

  ///获取门店信息
  getStoreInfoNet() async {
    String storeNo = await Constants.getInstance().getStoreNo();
    var request = {
      "data": {"storeNo": storeNo}
    };
    if (null != storeNo && ""!=storeNo) {
      ResultData result =
          await NetUtils.post(Api.getStoreByNo, request, _cancelToken);
      if (result.result) {
        SpUtil spUtil = await SpUtil.getInstance();
        StoreEntity storeEntity = StoreEntity.fromJson(result.data);
        spUtil.save(SpUtil.storeType, storeEntity.storeType);
        Constants.getInstance().setStoreType(storeEntity.storeType);
      }
    }
  }

  ///用户信息保存本地
  saveLoginInfoToLocal(LoginEntity data, String name) async {
    SpUtil spUtil = await SpUtil.getInstance();
    //保存sessionId到本地
    spUtil.save(SpUtil.SESSION_ID, data.sessionId);
    spUtil.save(SpUtil.NICK_NAME, data.nickName);
    spUtil.save(SpUtil.VERIFY_PHONE, name);
    spUtil.save(SpUtil.PASS_WORD, data.password);
    //用户Id
    spUtil.save(SpUtil.userId, data.userId);
    Constants.getInstance().setUserId(data.userId);
    spUtil.save(SpUtil.IS_LOGIN, true);
    //保存门店 编号
    spUtil.save(SpUtil.STORE_NO, data.storeNo);
    Constants.getInstance().setStoreNo(data.storeNo);
    Constants.getInstance().setStoreName(data.storeName);
    //保存名称
    spUtil.save(SpUtil.STORE_NAME, data.storeName);
    spUtil.save(SpUtil.RoleId, data.roleId);
    //权限字段
    spUtil.save(SpUtil.roleName, data.roleName);
    Constants.getInstance().setRoleName(data.roleName);
    //权限字段
    spUtil.save(SpUtil.roleDesc, data.roleDesc);
    Constants.getInstance().setRoleDesc(data.roleDesc);
    spUtil.save(SpUtil.RoleStatus, data.roleStatus);
    //模块权限
    spUtil.save(SpUtil.moduleCodeList, data.moduleCodeList.toString());
    //门店列表
    String storeJson = '{"storeList":${data.storeList}';
    spUtil.save(SpUtil.storeList, storeJson);
    //是否管理员
    spUtil.save(SpUtil.isAdmin, data.isAdmin);
    Constants.isAdmin = data.isAdmin;
  }

  ///登录页面
  Widget loginBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
            child: Divider(
          height: h(240),
          color: ResColors.transparent_00,
        )),
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
          child: GradientRedButton("登  录", width: 670, height: 88, onTap: () {
//            navigateTo(context, '$HomeIndexPage');
            onClickLogin();
          }),
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
          autofocus: false,
          decoration: InputDecoration(
              labelText: '18141924293',
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
            autofocus: false,
            decoration: InputDecoration(
                labelText: '123456',
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

  ///显示加载提示框
  showLoading({bool isLoadingClose = false}) {
    if (null != state && isLiveActivity) {
      state.setState(() {
        isShowLoading = true;
      });
    }
  }

  ///隐藏加载提示框
  hideLoading() {
    if (null != state && isLiveActivity) {
      state.setState(() {
        isShowLoading = false;
      });
    }
  }
}
