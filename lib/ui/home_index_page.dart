import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
import 'package:appaat_flutter/res/index_res.dart';

/// common
import 'package:appaat_flutter/common/base/base_widget.dart';
import 'package:appaat_flutter/common/global_config.dart';

/// page
import 'home/home_page.dart';
import 'workbench/work_home_page.dart';

///
import 'package:appaat_flutter/widget/btn_gradient_red.dart';

/// create by MZP 2019-08-23 11:41
///
/// 首页
///
///
class HomeIndexPage extends BaseStatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends BaseState<HomeIndexPage> {
  var currentPage;
  int currentIndex = 1;
  String titleText = "工作台";
  DateTime _lastPressedAt; // 上次点击时间
  final List<Widget> pageList = [HomePage(), HomeWorkbenchPage()];

//  final List<BottomNavigationBarItem> pageNavItemList = [
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.home), title: Text("综合看板")),
//    BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("工作台")),
//  ];

  @override
  Widget build(BuildContext context) {
    /// logon 初始化的 context 被销毁, 所以在homo 重新赋值
    App.context = context;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            createTitleBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: bottomBarHeight),
                child: IndexedStack(
                  index: currentIndex,
                  children: pageList,
                ),
              ),
            ),
          ],
        ),
      ),
    );
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: currentIndex,
//        items: pageNavItemList,
//        onTap: (index) {
//          setState(() {
//            currentPage = pageList[currentIndex = index];
//          });
//        },
//      ),
//    );
  }

  @override
  void initState() {
    super.initState();
    currentPage = pageList[currentIndex];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(HomeIndexPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void switchPage(int index) {
    setState(() {
      titleText = index == 0 ? '首页' : '工作台';
      currentPage = pageList[currentIndex = index];
    });
  }

  Widget createTitleBar() {
    return Container(
      height: h(88) + statusBarHeight,
      width: screenDpW,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [ResColors.red_e2, ResColors.red_fe]),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Text(
              titleText,
              style: TextStyle(
                fontSize: ResSize.text_title,
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 10,
              child: createTableRightWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Container createTableRightWidget() {
    bool isHome = currentIndex == 0;
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(44),
      ),
      child: Row(
        children: <Widget>[
          GradientRedButton(
            '首页',
            width: 96,
            height: 56,
            fontSize: 24,
            startColor: isHome ? ResColors.red_fe : Colors.white,
            endColor: isHome ? ResColors.red_e2 : Colors.white,
            textColor: isHome ? ResColors.white : ResColors.app_main,
            showBoxShadow: false,
            onTap: () {
              switchPage(0);
            },
          ),
          GradientRedButton(
            '工作台',
            width: 96,
            height: 56,
            fontSize: 24,
            startColor: isHome ? Colors.white : ResColors.red_fe,
            endColor: isHome ? Colors.white : ResColors.red_fe,
            textColor: isHome ? ResColors.app_main : ResColors.white,
            showBoxShadow: false,
            onTap: () {
              switchPage(1);
            },
          ),
        ],
      ),
    );
  }

  /// 监听返回键，点击两下退出程序
  Future<bool> _onBackPressed() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
      print("点击时间");
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      show("再按一次退出");
      return false;
    }
    return true;
  }
}
