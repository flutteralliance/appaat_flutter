import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// 用来做shared_preferences的存储
class SpUtil {
  ///键值
  static final String IS_LOGIN = "is_login";
  static final String NICK_NAME = "nickName";
  static final String SESSION_ID = "sessionId";
  static final String STORE_NO = "store_no";
  static final String STORE_NAME = "store_name";
  static final String PASS_WORD = "password";
  static final String HEAD_IMAGE = "store_logo";
  static final String ADD_PRICE = "add_price";
  static final String VERIFY_PHONE = "verifyPhone";
  static final String RoleStatus = "RoleStatus";
  static final String RoleId = "RoleId";
  static final String storeType = "storeType";
  static final String memberLevel = "memberLevel";
  static final String roleName = "RoleName";
  static final String roleDesc = "roleDesc";
  static final String moduleCodeList = "moduleCodeList";
  static final String storeList = "storeList";
  static final String isAdmin = "isAdmin";
  static final String userId = "userId";
  static final String historySetBean = "historySetBean";
  static final String transferInFactor1 = "50";
  static final String transferInFactor2 = "2";
  static final String transferOutFactor1 = "50";
  static final String transferOutFactor2 = "0";
  static final String safe = "30";
  static final String showStoreCount = "3";
  static final String USER_STATUS = "userStatus";

  static SpUtil _instance;

  static Future<SpUtil> get instance async {
    return await getInstance();
  }

  static SharedPreferences _spf;

  SpUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SpUtil> getInstance() async {
    if (_instance == null) {
      _instance = new SpUtil._();
      await _instance._init();
    }
    return _instance;
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  ///统一保存入口
  Future<bool> save(String key, var value) {
    if (value is bool) {
      return putBool(key, value);
    } else if (value is double) {
      return putDouble(key, value);
    } else if (value is int) {
      return putInt(key, value);
    } else if (value is String) {
      return putString(key, value);
    } else if (value is List<String>) {
      return putStringList(key, value);
    }else {
      return null;
    }
  }

  // 判断是否存在数据
  bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key);
  }

  Set<String> getKeys() {
    if (_beforeCheck()) return null;
    return _spf.getKeys();
  }

  get(String key) {
    if (_beforeCheck()) return null;
    return _spf.get(key);
  }

  getString(String key) {
    if (_beforeCheck()) return null;
    return _spf.getString(key);
  }

  Future<bool> putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _spf.setString(key, value);
  }

  bool getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf.getBool(key);
  }

  Future<bool> putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _spf.setBool(key, value);
  }

  int getInt(String key) {
    if (_beforeCheck()) return null;
    return _spf.getInt(key);
  }

  Future<bool> putInt(String key, int value) {
    if (_beforeCheck()) return null;
    return _spf.setInt(key, value);
  }

  double getDouble(String key) {
    if (_beforeCheck()) return null;
    return _spf.getDouble(key);
  }

  Future<bool> putDouble(String key, double value) {
    if (_beforeCheck()) return null;
    return _spf.setDouble(key, value);
  }

  List<String> getStringList(String key) {
    return _spf.getStringList(key);
  }

  Future<bool> putStringList(String key, List<String> value) {
    if (_beforeCheck()) return null;
    return _spf.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    if (_beforeCheck()) return null;
    return _spf.get(key);
  }

  Future<bool> remove(String key) {
    if (_beforeCheck()) return null;
    return _spf.remove(key);
  }

  Future<bool> clear() {
    if (_beforeCheck()) return null;
    return _spf.clear();
  }
}
