import 'package:appaat_flutter/entry/refund_entity.dart';
import 'package:appaat_flutter/widget/btn_gradient_red.dart';
import 'package:appaat_flutter/widget/spinkit/btn_border_red.dart';
import 'package:flutter/material.dart';
import 'package:appaat_flutter/common/base/base_widget.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/29 3:29 PM
///     desc   :
///     version: 1.0
/// </pre>
///
// ignore: must_be_immutable
class ListViewItem extends BaseStatelessWidget {
  Refund refund;

  ListViewItem(this.refund);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10,top: 10),
      color: ResColors.white,
      child: Column(
        children: <Widget>[
          topWidget(),
          Divider(height: 3, color: ResColors.gray_f1),
          goodsWidget(),
          Divider(height: 3, color: ResColors.gray_f1),
          bottomView()
        ],
      ),
    );
  }

  Widget topWidget() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image(
            image: payIcon(),
            width: w(45),
            height: h(45),
          ),
        ),
        Expanded(
          child: Text(
            payText(),
            style: TextStyle(fontSize: sp(24)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(DateTime.fromMicrosecondsSinceEpoch(refund.createTime*1000).toString(), style: TextStyle(fontSize: sp(24))),
        ),
      ],
    );
  }

  Widget goodsWidget() {
    return Row(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: getImageView(),
        ),
        goodsInfoView(),
        Padding(
          padding: const EdgeInsets.all(11),
          child: Text("${refund.goodsQty}件"),
        )
      ],
    );
  }

  bottomView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("退款金额:${refund.refundAmount}元",
                style: TextStyle(fontSize: sp(24))),
          ),
          BorderRedButton("查看详情",width: 160,height: 60,fontSize:28),
        ],
      ),
    );
  }

  Widget getImageView() {
    if (refund.goodsPic != null) {
      return Image.network(refund.goodsPic != null ? refund.goodsPic : "",
          width: w(160), height: h(160));
    } else {
      return Image(
          image: AssetImage("images/circle_img_error.png"),
          width: w(160),
          height: h(160));
    }
  }

  goodsInfoView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(refund.goodsName,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: sp(30))),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text("${refund.goodsColor} / ${refund.specsName}",
                style: TextStyle(fontSize: sp(24))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child:
                Text(refund.id.toString(), style: TextStyle(fontSize: sp(24))),
          )
        ],
      ),
    );
  }

  payIcon() {
    if (null != refund.payChannel) {
      switch (refund.payChannel) {
        case "wxpay":
          return AssetImage("images/ic_we_chart.png");
        case "alipay":
          return AssetImage("images/ic_alipay.png");
        case "balancepay":
          return AssetImage("images/ic_balance.png");
        default:
          return AssetImage("images/ic_cash.png");
      }
    } else {
      return AssetImage("images/ic_cash.png");
    }
  }

  payText() {
    if (null != refund.payChannel) {
      switch (refund.payChannel) {
        case "wxpay":
          return "微信原路返回";
        case "alipay":
          return "支付宝原路返回";
        case "balancepay":
          return "余额原路返回";
        default:
          return "店长垫付现金";
      }
    } else {
      return "店长垫付现金";
    }
  }

}
