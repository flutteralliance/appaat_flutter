import 'package:json_annotation/json_annotation.dart';

part 'refund_entity.g.dart';


List<Refund> getRefundList(List<dynamic> list){
	List<Refund> result = [];
	list.forEach((item){
		result.add(Refund.fromJson(item));
	});
	return result;
}
@JsonSerializable()
class Refund extends Object {

	@JsonKey(name: 'id')
	int id;

	@JsonKey(name: 'returnOrderId')
	String returnOrderId;

	@JsonKey(name: 'storeNo')
	String storeNo;

	@JsonKey(name: 'orderId')
	String orderId;

	@JsonKey(name: 'orderDetailId')
	int orderDetailId;

	@JsonKey(name: 'orderDate')
	int orderDate;

	@JsonKey(name: 'goodsId')
	int goodsId;

	@JsonKey(name: 'goodsName')
	String goodsName;

	@JsonKey(name: 'goodsPic')
	String goodsPic;

	@JsonKey(name: 'goodsColor')
	String goodsColor;

	@JsonKey(name: 'specsName')
	String specsName;

	@JsonKey(name: 'goodsQty')
	int goodsQty;

	@JsonKey(name: 'refundableAmount')
	double refundableAmount;

	@JsonKey(name: 'refundAmount')
	double refundAmount;

	@JsonKey(name: 'createTime')
	int createTime;

	@JsonKey(name: 'returnDate')
	int returnDate;

	@JsonKey(name: 'transactor')
	String transactor;

	@JsonKey(name: 'status')
	String status;

	@JsonKey(name: 'payChannel')
	String payChannel;

	Refund(this.id,this.returnOrderId,this.storeNo,this.orderId,this.orderDetailId,this.orderDate,this.goodsId,this.goodsName,this.goodsPic,this.goodsColor,this.specsName,this.goodsQty,this.refundableAmount,this.refundAmount,this.createTime,this.returnDate,this.transactor,this.status,this.payChannel,);

	factory Refund.fromJson(Map<String, dynamic> srcJson) => _$RefundFromJson(srcJson);

	Map<String, dynamic> toJson() => _$RefundToJson(this);

}


