import 'package:flutter/material.dart';
import 'package:appaat_flutter/utils/shared_preferences.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/23 3:44 PM
///     desc   : 全局值存储
///     version: 1.0
/// </pre>
///
class Constants {

  String storeNo;
  int storeType = 0; //1-加盟店；2-合作店；3-会员店
  int memberLevel = 0;
  String storeName;
  String roleName; // Administrator 大区经理 店长 店员
  String roleDesc;
  static bool isAdmin = false;
  int userId = 10086;

  static Constants singleton;

  static Constants getInstance() {
    if (singleton == null) {
      singleton = new Constants();
    }
    return singleton;
  }

  Future<String> getStoreName() async {
    if (null != storeName && "" != storeName)
      return storeName;
    else {
      SpUtil sp = await SpUtil.getInstance();
      return sp.getString(SpUtil.STORE_NAME);
    }
  }

  void setStoreName(String storeName) {
    this.storeName = storeName;
  }

  Future<String> getRoleName() async {
    if (null != roleName && "" != roleName)
      return roleName;
    else {
      SpUtil sp = await SpUtil.getInstance();
      return sp.getString(SpUtil.roleName);
    }
  }

  void setRoleName(String roleName) {
    roleName = roleName;
  }

  Future<String> getRoleDesc()async {
    if (null != roleDesc && ""!=roleDesc)
      return roleDesc;
    else {
      SpUtil sp = await SpUtil.getInstance();
      return sp.getString(SpUtil.roleDesc);
    }
  }

  void setRoleDesc(String roleDesc) {
    this.roleDesc = roleDesc;
  }

  Future<int> getUserId() async{
    if (10086 != userId)
      return userId;
    else{
      SpUtil sp = await SpUtil.getInstance();
      return sp.getInt(SpUtil.userId);
    }
  }

  void setUserId(int userId) {
    this.userId = userId;
  }

  Future<String> getStoreNo() async{
    if (null != storeNo && ""!=storeNo)
      return storeNo;
    else {
      SpUtil sp = await SpUtil.getInstance();
      return sp.getString(SpUtil.STORE_NO);
    }
  }

  void setStoreNo(String storeNo) {
    this.storeNo = storeNo;
  }

  Future<int> getStoreType() async{
    if (0 == storeType) {
      SpUtil sp = await SpUtil.getInstance();
      return sp.getInt(SpUtil.storeType);
    }
    return storeType;
  }

  void setStoreType(int storeType) {
    this.storeType = storeType;
  }

  Future<int> getMemberLevel() async{
    if (0 == memberLevel) {
      SpUtil sp = await SpUtil.getInstance();
      return sp.getInt(SpUtil.memberLevel);
    }
    return memberLevel;
  }

  void setMemberLevel(int memberLevel) {
    this.memberLevel = memberLevel;
  }
}
