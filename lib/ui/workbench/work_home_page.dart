import 'package:appaat_flutter/res/index_res.dart';
import 'package:flutter/material.dart';

///
import 'package:appaat_flutter/common/base/base_widget.dart';

/// layout
import 'package:appaat_flutter/widget/layout/layout_home_workbench.dart';

/// create by MZP 2019-08-23 11:50
///
/// 首页-工作台
///
///

class HomeWorkbenchPage extends BaseStatelessWidget {
//  String moduleList = "";
  final List<ItemBean> itemList = [];

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      backgroundColor: ResColors.gray_f1,
      body: Column(
        children: <Widget>[
          WorkbenchTopWidget(),
          WorkbenchCenterWidget(itemList,context),
          WorkbenchBottomWidget(),
        ],
      ),
    );
  }

  void initData() {
    itemList.clear();

    // 2.0 版本隐藏
//    checkAddItemBean('CheckOrderKey', "确认订单", "checkOrder");

    checkAddItemBean('OrderListKey', "门店订单", "home/item_store");
    checkAddItemBean('CashPurcaseKey', "移动收银", "home/item_cashPurcase");
    checkAddItemBean('InWarehouse', "商品入库", "home/item_inWarehouse");
    checkAddItemBean('OutWarehouse', "商品出库", "home/item_outWarehouse");
    checkAddItemBean('TakeStockKey', "盘货工具", "home/item_take_stock");
    checkAddItemBean('ReturnGoodsKey', "顾客退货", "home/item_returnGoods");
    checkAddItemBean('CustomerManagerKey', "顾客管理", "home/item_memberManager");
    checkAddItemBean('MonthSettleKey', "当月业绩", "home/item_monthSettle");
    checkAddItemBean('BarcodeReviewKey', "条码追溯", "home/item_barcodeReview");
    checkAddItemBean('MonthSettleKey', "当月业绩", "home/item_monthSettle");
    checkAddItemBean('AdjustApprovalKey', "调拨审批", "home/item_adjustApproval");
    checkAddItemBean('GuiderManageKey', "人员管理", "home/item_hrManage");
    checkAddItemBean(
        'ExclusiveQRCodeKey', "专属二维码", "home/item_exclusiveQrCode");
    checkAddItemBean(
        'StorePerformanceKey', "门店应收", "home/item_store_performance");
    checkAddItemBean(
        'StaffPerformanceKey', "我的业绩", "home/item_staffPerformance");
    checkAddItemBean('StoreStockKey', "门店库存", "home/item_store_stock");
    checkAddItemBean('MaterialKey', "图文素材", "home/item_material");
  }

  void checkAddItemBean(String key, String name, String img) {
//    if (moduleList.contains(key)) {
    itemList.add(ItemBean(name, img));
//    }
  }
}
