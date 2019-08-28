class StoreEntity {
	String area;
	int storeType;
	double lng;
	String city;
	int updateTime;
	String remark;
	int storeId;
	double incomeMatchRange;
	String storeIntro;
	double postage;
	String storeNo;
	String phoneNumber;
	String province;
	int createTime;
	double matchRange;
	String storeName;
	String location;
	double lat;
	int status;

	StoreEntity({this.area, this.storeType, this.lng, this.city, this.updateTime, this.remark, this.storeId, this.incomeMatchRange, this.storeIntro, this.postage, this.storeNo, this.phoneNumber, this.province, this.createTime, this.matchRange, this.storeName, this.location, this.lat, this.status});

	StoreEntity.fromJson(Map<String, dynamic> json) {
		area = json['area'];
		storeType = json['storeType'];
		lng = json['lng'];
		city = json['city'];
		updateTime = json['updateTime'];
		remark = json['remark'];
		storeId = json['storeId'];
		incomeMatchRange = json['incomeMatchRange'];
		storeIntro = json['storeIntro'];
		postage = json['postage'];
		storeNo = json['storeNo'];
		phoneNumber = json['phoneNumber'];
		province = json['province'];
		createTime = json['createTime'];
		matchRange = json['matchRange'];
		storeName = json['storeName'];
		location = json['location'];
		lat = json['lat'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['area'] = this.area;
		data['storeType'] = this.storeType;
		data['lng'] = this.lng;
		data['city'] = this.city;
		data['updateTime'] = this.updateTime;
		data['remark'] = this.remark;
		data['storeId'] = this.storeId;
		data['incomeMatchRange'] = this.incomeMatchRange;
		data['storeIntro'] = this.storeIntro;
		data['postage'] = this.postage;
		data['storeNo'] = this.storeNo;
		data['phoneNumber'] = this.phoneNumber;
		data['province'] = this.province;
		data['createTime'] = this.createTime;
		data['matchRange'] = this.matchRange;
		data['storeName'] = this.storeName;
		data['location'] = this.location;
		data['lat'] = this.lat;
		data['status'] = this.status;
		return data;
	}
}
