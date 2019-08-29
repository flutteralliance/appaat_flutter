import 'package:appaat_flutter/entry/refund_entity.dart';
import 'package:appaat_flutter/utils/constants.dart';
import 'package:appaat_flutter/widget/layout/refund/layout_listview_item.dart';
import 'package:appaat_flutter/widget/view_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:appaat_flutter/common/base/base_widget.dart';
import 'package:appaat_flutter/widget/layout/refund/layout_customer_refund.dart';
import 'package:appaat_flutter/common/base/base_function.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/28 7:54 PM
///     desc   : 顾客退货
///     version: 1.0
/// </pre>

// ignore: must_be_immutable
class CustomerRefundListPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RefundState();
  }
}

class RefundState extends BaseState<CustomerRefundListPage> with BaseFunction {
  int page = 1;
  int size = 20;
  int total = 0;
  bool isRefresh = true;
  CancelToken _cancelToken = CancelToken();
  List<Refund> refundList = List<Refund>();
  List<Refund> currentRefundList = List<Refund>();

  @override
  void initState() {
    super.initState();
    downLoadListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColors.gray_f1,
      appBar: appBarRefund(),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: ListView.separated(
          itemCount: refundList.length,
          itemBuilder: (context, index) {
            ///分页加载判断是否加载下一页
            if (index + 1 == page * size ) {
              if (currentRefundList.length + page * size < total) {
                isRefresh = false;
                page++;
                downLoadListData();
                ///正在加载
                return listViewLoadingBottom();
              } else {
                ///没有更多数据
                return listViewNoDataBottom();
              }
            }
            return ListViewItem(refundList[index]);
          },
          separatorBuilder: (context, index) => Divider(
            height: 0,
            color: ResColors.gray_f1,
          ),
        ),
      ),
    );
  }

  ///下拉刷新
  Future refreshData() async {
    page = 1;
    size = 20;
    isRefresh = true;
    downLoadListData();
  }

  ///上拉加载
  Future downLoadListData() async {
    var request = {
      "storeNo": Constants.getInstance().storeNo,
      "page": page,
      "size": size
    };
    ResultData resultData =
        await NetUtils.post(Api.orders, request, _cancelToken);
    if (resultData.result) {
      if (null != resultData.total) {
        total = resultData.total as int;
      }
      currentRefundList = getRefundList(resultData.data);
      if (isRefresh) {
        refundList = getRefundList(resultData.data);
      } else {
        refundList.addAll(getRefundList(resultData.data));
      }
      setState(() {});
    }
  }
}
