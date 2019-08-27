import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/23 6:15 PM
///     desc   :
///     version: 1.0
/// </pre>
///
class Md5Util {

  /// md5 加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}
