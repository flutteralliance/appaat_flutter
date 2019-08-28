class LoginEntity {
	int gender;
	int roleId;
	String nickName;
	String headImage;
	List<String> moduleCodeList;
	int updateTime;
	dynamic remark;
	List<LoginStorelist> storeList;
	String wxUid;
	bool isAdmin;
	String sessionId;
	int userId;
	String modules;
	int roleStatus;
	String storeNo;
	String password;
	String roleDesc;
	int createTime;
	String name;
	String roleName;
	String storeName;
	int id;
	int status ;

	LoginEntity({this.gender, this.roleId, this.nickName, this.headImage, this.moduleCodeList, this.updateTime, this.remark, this.storeList, this.wxUid, this.isAdmin, this.sessionId, this.userId, this.modules, this.roleStatus, this.storeNo, this.password, this.roleDesc, this.createTime, this.name, this.roleName, this.storeName, this.id, this.status});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		gender = json['gender'];
		roleId = json['roleId'];
		nickName = json['nickName'];
		headImage = json['headImage'];
		moduleCodeList = json['moduleCodeList']?.cast<String>();
		updateTime = json['updateTime'];
		remark = json['remark'];
		if (json['storeList'] != null) {
			storeList = new List<LoginStorelist>();(json['storeList'] as List).forEach((v) { storeList.add(new LoginStorelist.fromJson(v)); });
		}
		wxUid = json['wxUid'];
		isAdmin = json['isAdmin'];
		sessionId = json['sessionId'];
		userId = json['userId'];
		modules = json['modules'];
		roleStatus = json['roleStatus'];
		storeNo = json['storeNo'];
		password = json['password'];
		roleDesc = json['roleDesc'];
		createTime = json['createTime'];
		name = json['name'];
		roleName = json['roleName'];
		storeName = json['storeName'];
		id = json['id'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['gender'] = this.gender;
		data['roleId'] = this.roleId;
		data['nickName'] = this.nickName;
		data['headImage'] = this.headImage;
		data['moduleCodeList'] = this.moduleCodeList;
		data['updateTime'] = this.updateTime;
		data['remark'] = this.remark;
		if (this.storeList != null) {
      data['storeList'] =  this.storeList.map((v) => v.toJson()).toList();
    }
		data['wxUid'] = this.wxUid;
		data['isAdmin'] = this.isAdmin;
		data['sessionId'] = this.sessionId;
		data['userId'] = this.userId;
		data['modules'] = this.modules;
		data['roleStatus'] = this.roleStatus;
		data['storeNo'] = this.storeNo;
		data['password'] = this.password;
		data['roleDesc'] = this.roleDesc;
		data['createTime'] = this.createTime;
		data['name'] = this.name;
		data['roleName'] = this.roleName;
		data['storeName'] = this.storeName;
		data['id'] = this.id;
		data['status'] = this.status;
		return data;
	}
}

class LoginStorelist {
	String storeNo;
	dynamic createTime;
	dynamic roleId;
	String storeName;
	dynamic id;
	dynamic userId;

	LoginStorelist({this.storeNo, this.createTime, this.roleId, this.storeName, this.id, this.userId});

	LoginStorelist.fromJson(Map<String, dynamic> json) {
		storeNo = json['storeNo'];
		createTime = json['createTime'];
		roleId = json['roleId'];
		storeName = json['storeName'];
		id = json['id'];
		userId = json['userId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['storeNo'] = this.storeNo;
		data['createTime'] = this.createTime;
		data['roleId'] = this.roleId;
		data['storeName'] = this.storeName;
		data['id'] = this.id;
		data['userId'] = this.userId;
		return data;
	}
}
