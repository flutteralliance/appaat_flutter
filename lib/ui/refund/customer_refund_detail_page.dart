import 'package:appaat_flutter/entry/refund_detail_entity.dart';
import 'package:appaat_flutter/widget/layout/refund/layout_customer_refund_detail.dart';
import 'package:appaat_flutter/widget/view_state.dart';
import 'package:flutter/material.dart';
import 'package:appaat_flutter/common/base/base_widget.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/29 6:23 PM
///     desc   : 顾客退货详情
///     version: 1.0
/// </pre>
///
// ignore: must_be_immutable
class CustomerRefundDetailPage extends BaseStatefulWidget {
  String returnOrderId;

  CustomerRefundDetailPage(this.returnOrderId);

  @override
  State<StatefulWidget> createState() {
    return RefundDetailState(returnOrderId);
  }
}

class RefundDetailState extends BaseState<CustomerRefundDetailPage> {
  String returnOrderId;

  RefundDetailState(this.returnOrderId);

  @override
  void initState() {
    super.initState();
    downLoadRefundDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.gray_f1,
      appBar: appBarRefund(),
      body: FutureState(
        future: downLoadRefundDetail(),
        successBuilder: (context, it) {
          RefundDetailEntity detailEntity = it.data;
          return bodyLayout(detailEntity);
        },
      ),
    );
  }

  Future downLoadRefundDetail() async {
    var params = {"returnOrderId": returnOrderId};
    ResultData resultData = await NetUtils.post(Api.order, params, null);
    if (resultData.result) {
      RefundDetailEntity bean = RefundDetailEntity.fromJson(resultData.data);
      return bean;
    }
  }
}
