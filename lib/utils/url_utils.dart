import 'package:url_launcher/url_launcher.dart';

/// create by MZP 2019-08-13 20:29
///
/// 兼容iOS 和 Android 的 打开URL
///
///
class UrlUtils {
  /// 打开系统电话页面
  static void tel(String phone) async {
    var url = "tel:" + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("error");
    }
  }

  static void http(String path) async {
    var url = "";
    if (path.startsWith("http:")) {
      url += path;
    } else {
      url = "http:" + path;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("error");
    }
  }

  static void sms(String message) async {
    var url = "sms:" + message;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("error");
    }
  }
//  Scheme	Action
//  http:<URL> , https:<URL>, e.g. http://flutter.dev	Open URL in the default browser
//  mailto:<email address>?subject=<subject>&body=<body>, e.g.
//  mailto:smith@example.org?subject=News&body=New%20plugin	Create email to in the default email app
//  tel:<phone number>, e.g. tel:+1 555 010 999	Make a phone call to using the default phone app
//  sms:<phone number>, e.g. sms:5550101234	Send an SMS message to using the default messaging app
}
