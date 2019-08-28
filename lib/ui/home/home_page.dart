import 'package:flutter/material.dart';

///
import 'package:appaat_flutter/common/base/base_widget.dart';

///
import 'synthetical/syn_inventory_details.dart';
import 'synthetical/syn_replenishment_analysis.dart';
import 'synthetical/syn_sales_statistics.dart';
import 'synthetical/syn_transfer_analysis.dart';

/// create by MZP 2019-08-23 11:50
///
/// 首页
///
///

class HomePage extends BaseStatelessWidget {
  final List<String> _tabs = ['销售统计', '补货分析', '调货分析', '库存明细'];
  final List<Widget> _tabViews = [
    SynSalesStatistics(),
    SynReplenishmentAnalysis(),
    SynTransferAnalysis(),
    SynInventoryDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Container(
        color: ResColors.gray,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: TabBar(
                labelColor: ResColors.app_main,
                unselectedLabelColor: ResColors.text_gray,
                indicatorColor: ResColors.app_main,
                tabs: _tabs.map((it) => Tab(text: it)).toList(),
              ),
            ),
            Expanded(child: TabBarView(children: _tabViews)),
          ],
        ),
      ),
    );
  }
}
