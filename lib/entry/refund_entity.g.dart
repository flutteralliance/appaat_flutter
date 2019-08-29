// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refund _$RefundFromJson(Map<String, dynamic> json) {
  return Refund(
    json['id'] as int,
    json['returnOrderId'] as String,
    json['storeNo'] as String,
    json['orderId'] as String,
    json['orderDetailId'] as int,
    json['orderDate'] as int,
    json['goodsId'] as int,
    json['goodsName'] as String,
    json['goodsPic'] as String,
    json['goodsColor'] as String,
    json['specsName'] as String,
    json['goodsQty'] as int,
    (json['refundableAmount'] as num)?.toDouble(),
    (json['refundAmount'] as num)?.toDouble(),
    json['createTime'] as int,
    json['returnDate'] as int,
    json['transactor'] as String,
    json['status'] as String,
    json['payChannel'] as String,
  );
}

Map<String, dynamic> _$RefundToJson(Refund instance) => <String, dynamic>{
      'id': instance.id,
      'returnOrderId': instance.returnOrderId,
      'storeNo': instance.storeNo,
      'orderId': instance.orderId,
      'orderDetailId': instance.orderDetailId,
      'orderDate': instance.orderDate,
      'goodsId': instance.goodsId,
      'goodsName': instance.goodsName,
      'goodsPic': instance.goodsPic,
      'goodsColor': instance.goodsColor,
      'specsName': instance.specsName,
      'goodsQty': instance.goodsQty,
      'refundableAmount': instance.refundableAmount,
      'refundAmount': instance.refundAmount,
      'createTime': instance.createTime,
      'returnDate': instance.returnDate,
      'transactor': instance.transactor,
      'status': instance.status,
      'payChannel': instance.payChannel,
    };
