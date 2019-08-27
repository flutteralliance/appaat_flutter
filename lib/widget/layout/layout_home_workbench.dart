import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
import 'package:appaat_flutter/res/index_res.dart';

/// common
import 'package:appaat_flutter/common/base/base_widget.dart';

/// widget
import 'package:appaat_flutter/widget/btn_gradient_red.dart';

/// create by MZP 2019-08-23 15:13
///
/// 首页-工作台-widget
///
///

/// 头部
class WorkbenchTopWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      color: Colors.white,
      height: h(88),
      child: Row(
        children: [
          Icon(Icons.room, color: ResColors.app_main),
          Expanded(
            child: Text(
              '当前操作门店: ',
              style: TextStyle(fontSize: ResSize.text_content_title),
            ),
          ),
          IconButton(
              icon: Icon(Icons.store, color: ResColors.text_gray),
              onPressed: () {
                show("点击了");
              }),
        ],
      ),
    );
  }
}

/// 内容
class WorkbenchCenterWidget extends BaseStatelessWidget {
  final List<ItemBean> itemList;

  WorkbenchCenterWidget(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(10),
        // 圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

        child: GridView.count(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          // 创建几列
          crossAxisCount: 4,
          // Axis.horizontal表示横向滑动，scrollDirection: Axis.vertical表示纵向滑动
          scrollDirection: Axis.vertical,
          // 列之间的间距
//          crossAxisSpacing: 10,
          // 行之间的间距
//          mainAxisSpacing: 10,
          // 默认false 是否根据子孩子的宽高自动包裹item自身
          shrinkWrap: false,
          // true表示数据倒序排列 false表示顺序排列
          reverse: false,
          // 子孩子的比例
          childAspectRatio: 1,
          // 设置子孩子item,这里传入子孩子控件
          children: _createItems(),
        ),
      ),
    );
  }

  List<Widget> _createItems() {
    return itemList.map((it) {
      return _item(it);
    }).toList();
  }

  Widget _item(ItemBean it) {
    return Column(
      children: <Widget>[
        Image(
          width: w(112),
          height: w(112),
          image: assetImageXX(it.img),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(it.name),
        ),
      ],
    );
  }
}

/// 底部
class WorkbenchBottomWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text('版本号: 1.4.2'),
          ),
          GradientRedButton(
            '退出',
            width: 462,
            height: 88,
          ),
        ],
      ),
    );
  }
}

class ItemBean {
  String name;
  String img;

  ItemBean(this.name, this.img);
}
