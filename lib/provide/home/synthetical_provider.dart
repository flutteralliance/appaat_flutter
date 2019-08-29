import 'package:flutter/material.dart';

///
import 'package:appaat_flutter/common/api/net_utils.dart';
import 'package:appaat_flutter/common/api/api.dart';

///
import 'package:appaat_flutter/entry/home_syn_sales_statistics.dart';

/// create by MZP 2019-08-28 20:22
///
/// 首页-综合看板 provider
///
///

class HomeSyntheticalProvider with ChangeNotifier {
  SalesStatisticsModel _salesStatisticsModel;

  SalesStatisticsModel get salesStatistics => _salesStatisticsModel;

  /// 根据goodsId 查询商品信息
  Future queryData() {
    var params = {
      "data": {
        "tradeType": "APP",
        "startTime": 1566921600000,
        "mom_startTime": 1566835200000,
        "mom_endTime": 1566921599000,
        "endTime": 1567007999000,
        "userId": 23
      }
    };

    return NetUtils.post(Api.get_home_storeSalesStatistics, params, null)
        .then((it) {
      if (it.result) {
        SalesStatisticsModel data = SalesStatisticsModel.fromJson(it.data);
        if (data != null) {
          var all = data.allSalesStatistics;
          data.storeSalesList.insert(
              0,
              StoreSales(
                  '',
                  all.buyAmount,
                  all.momRiseRate,
                  all.salesAmount,
                  all.goodsQuantity,
                  '线下全部',
                  all.orderQuantity,
                  all.grossProfitRate,
                  all.momSalesAmount,
                  all.perCustomerSales,
                  all.jointRate));
          _salesStatisticsModel = data;
          notifyListeners();
        }
        return data;
      } else {
        return "获取数据失败, 请重试";
      }
    });
  }
}
