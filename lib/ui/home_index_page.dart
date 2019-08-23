import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// common
import 'package:appaat_flutter/common/base/base_widget.dart';

/// page
import 'home/home_page.dart';
import 'workbench/work_home_page.dart';

/// create by MZP 2019-08-23 11:41
///
/// 首页
///
///
class HomeIndexPage extends BaseStatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomeIndexPage> {
  var currentPage;
  int currentIndex = 0;
  final List<Widget> pageList = [HomePage(), HomeWorkbenchPage()];
  final List<BottomNavigationBarItem> pageNavItemList = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("综合看板")),
    BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("工作台")),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: pageNavItemList,
        onTap: (index) {
          setState(() {
            currentPage = pageList[currentIndex = index];
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentPage = pageList[0];
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
}
