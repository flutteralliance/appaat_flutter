import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

///
import 'package:appaat_flutter/common/base/base_widget.dart';

///
import 'package:appaat_flutter/utils/date_util.dart';

/// create by MZP 2019-08-29 10:31
///
/// 自定义时间选择
///
///
class HomeCustomTime extends BaseStatefulWidget {
  static void start(BuildContext context) {
    App.navigateTo(context, '$HomeCustomTime');
  }

  @override
  HomeCustomTimeState createState() => new HomeCustomTimeState();
}

class HomeCustomTimeState extends BaseState<HomeCustomTime> {
  DateTime date = DateTime.now();
  double _kPickerSheetHeight = 216.0;
  double _kPickerItemHeight = 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.gray,
      appBar: AppBar(
        backgroundColor: ResColors.app_main,
        title: Text('自定义'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: screenDpW,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(width: 1, color: ResColors.gray)),
              ),
              child: Text(
                '自定义时间',
                style: TextStyle(fontSize: ResSize.text_content),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: screenDpW,
              color: Colors.white,
              height: 70,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildDatePicker(context),
                      Text('  -  '),
                      _buildDatePicker(context),
                    ],
                  ),
                  Positioned(
                      right: 0,
                      child: OutlineButton(
                        color: ResColors.gray,
                        onPressed: () {},
                        borderSide: BorderSide(color: ResColors.app_main),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Text(
                          '确定',
                          style: TextStyle(color: ResColors.app_main),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: date,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => date = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: ResColors.gray_light,
          //圆角
          borderRadius: BorderRadius.circular(5),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 4, right: 4),
          height: 40,
          child: Row(
            children: <Widget>[
              Text(intl.DateFormat.yMMMMd().format(date)),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(HomeCustomTime oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
