class RefundDetailEntity {
	double refundableAmount;
	dynamic brandName;
	String specsName;
	String orderId;
	int goodsId;
	String goodsColor;
	dynamic updateTime;
	int goodsQty;
	int orderDetailId;
	String transactor;
	String storeNo;
	int returnDate;
	int createTime;
	dynamic returnReason;
	String returnOrderId;
	dynamic goodsPic;
	dynamic payChannel;
	int id;
	int orderDate;
	String goodsName;
	double refundAmount;
	String status;

	RefundDetailEntity({this.refundableAmount, this.brandName, this.specsName, this.orderId, this.goodsId, this.goodsColor, this.updateTime, this.goodsQty, this.orderDetailId, this.transactor, this.storeNo, this.returnDate, this.createTime, this.returnReason, this.returnOrderId, this.goodsPic, this.payChannel, this.id, this.orderDate, this.goodsName, this.refundAmount, this.status});

	RefundDetailEntity.fromJson(Map<String, dynamic> json) {
		refundableAmount = json['refundableAmount'];
		brandName = json['brandName'];
		specsName = json['specsName'];
		orderId = json['orderId'];
		goodsId = json['goodsId'];
		goodsColor = json['goodsColor'];
		updateTime = json['updateTime'];
		goodsQty = json['goodsQty'];
		orderDetailId = json['orderDetailId'];
		transactor = json['transactor'];
		storeNo = json['storeNo'];
		returnDate = json['returnDate'];
		createTime = json['createTime'];
		returnReason = json['returnReason'];
		returnOrderId = json['returnOrderId'];
		goodsPic = json['goodsPic'];
		payChannel = json['payChannel'];
		id = json['id'];
		orderDate = json['orderDate'];
		goodsName = json['goodsName'];
		refundAmount = json['refundAmount'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['refundableAmount'] = this.refundableAmount;
		data['brandName'] = this.brandName;
		data['specsName'] = this.specsName;
		data['orderId'] = this.orderId;
		data['goodsId'] = this.goodsId;
		data['goodsColor'] = this.goodsColor;
		data['updateTime'] = this.updateTime;
		data['goodsQty'] = this.goodsQty;
		data['orderDetailId'] = this.orderDetailId;
		data['transactor'] = this.transactor;
		data['storeNo'] = this.storeNo;
		data['returnDate'] = this.returnDate;
		data['createTime'] = this.createTime;
		data['returnReason'] = this.returnReason;
		data['returnOrderId'] = this.returnOrderId;
		data['goodsPic'] = this.goodsPic;
		data['payChannel'] = this.payChannel;
		data['id'] = this.id;
		data['orderDate'] = this.orderDate;
		data['goodsName'] = this.goodsName;
		data['refundAmount'] = this.refundAmount;
		data['status'] = this.status;
		return data;
	}
}
