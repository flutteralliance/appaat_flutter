import 'package:flutter/material.dart';
import 'package:appaat_flutter/common/base/base_widget.dart';

/// layout-widget
import 'package:appaat_flutter/widget/layout/home/layout_syn_sales_statistics.dart';
import 'package:appaat_flutter/widget/view_state.dart';

///
import 'package:appaat_flutter/provide/home/synthetical_provider.dart';

/// create by MZP 2019-08-28 14:37
///
/// 首页-综合看板-销售统计
///
///

class SynSalesStatistics extends BaseStatelessWidget {
  HomeSyntheticalProvider provider;
  var queryData;

  @override
  Widget build(BuildContext context) {
    if (provider == null) {
      provider = Provider.of<HomeSyntheticalProvider>(context);
      queryData = provider.queryData();
    }

    return FutureState(
      future: queryData,
      successBuilder: (context, snapshot) {
        return Column(
          children: <Widget>[
            SalesTimeWidget(),
            SalesTableWidget(),
//            SalesStatisticsWidget(),
          ],
        );
      },
    );
  }
}
