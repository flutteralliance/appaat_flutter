import 'package:flutter/material.dart';
import 'package:appaat_flutter/common/base/base_widget.dart';

/// create by MZP 2019-08-29 10:31
///
/// 自定义时间选择
///
///

class HomeCustomTime extends BaseStatelessWidget {
  static void start() {
    App.navigateTo(App.context, '$HomeCustomTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.gray,
      appBar: AppBar(
        title: Text('自定义'),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: ResColors.gray)),
              ),
              child: Text('自定义时间'),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Text(''),
                  Text('-'),
                  Text(''),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
