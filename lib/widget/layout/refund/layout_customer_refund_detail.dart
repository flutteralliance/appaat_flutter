import 'package:appaat_flutter/common/base/base_widget.dart';
import 'package:appaat_flutter/entry/refund_detail_entity.dart';
import 'package:flutter/material.dart';
import 'package:appaat_flutter/utils/date_utils.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/29 8:02 PM
///     desc   :
///     version: 1.0
/// </pre>
///

Widget appBarRefund() {
  return AppBar(
    backgroundColor: ResColors.red_e2,
    title: Text(
      "退货成功",
      style: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}

// ignore: must_be_immutable, camel_case_types
class bodyLayout extends BaseStatelessWidget {

  RefundDetailEntity detailEntity;

  bodyLayout(this.detailEntity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        topView(detailEntity),
        bottomView(detailEntity)
      ],
    );
  }

  ///订单视图
  Widget topView(RefundDetailEntity detailEntity) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "退货单：${detailEntity.returnOrderId!=null?detailEntity.returnOrderId:"-"}",
                  style: TextStyle(color: ResColors.black_34, fontSize: sp(28)),
                ),
                Text(DateUtil.getDateStrByMs(detailEntity.createTime, format: DateFormat.YEAR_MONTH_DAY))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 3, color: ResColors.gray_f1),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "应退金额：${detailEntity.refundableAmount}元",
                          style: TextStyle(color: ResColors.black_34, fontSize: sp(28)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "实退金额：${detailEntity.refundAmount}元",
                            style: TextStyle(color: ResColors.black_34, fontSize: sp(28)),
                          ),
                        )
                      ],
                    )),
                Text(
                  "操作人：${detailEntity.transactor}",
                  style: TextStyle(color: ResColors.black_34, fontSize: sp(28)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 3, color: ResColors.gray_f1),
            ),
            Row(
              children: <Widget>[
                Text(
                  "退货方式：",
                  style: TextStyle(color: ResColors.black_34, fontSize: sp(28)),
                ),
                Image(
                  image: payIcon(detailEntity.payChannel),
                  width: w(45),
                  height: h(45),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(payText(detailEntity.payChannel)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///商品视图
  bottomView(RefundDetailEntity detailEntity) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: ResColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text("品牌名称：${detailEntity.brandName != null ? detailEntity.brandName : "叮当专场"}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(height: 3, color: ResColors.gray_f1,),
          ),
          Row(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(10),
                child: getImageView(),
              ),
              goodsInfoView(),
              Padding(
                padding: const EdgeInsets.all(11),
                child: Text("${detailEntity.goodsQty}件"),
              )
            ],
          ),
        ],
      ),
    );
  }

  ///支付方式图标
  payIcon(String payChannel) {
    if (null != payChannel) {
      switch (payChannel) {
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

  ///支付方式文字
  payText(String payChannel) {
    if (null != payChannel) {
      switch (payChannel) {
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

  Widget getImageView() {
    if (detailEntity.goodsPic != null) {
      return Image.network(detailEntity.goodsPic != null ? detailEntity.goodsPic : "",
          width: w(160), height: h(160));
    } else {
      return Image(
          image: AssetImage("images/circle_img_error.png"),
          width: w(160),
          height: h(160));
    }
  }

  ///商品信息 -
  goodsInfoView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(detailEntity.goodsName,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: sp(30))),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text("${detailEntity.goodsColor} / ${detailEntity.specsName}",
                style: TextStyle(fontSize: sp(24))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child:
            Text(detailEntity.goodsId.toString(), style: TextStyle(fontSize: sp(24))),
          )
        ],
      ),
    );
  }
}

