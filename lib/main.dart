import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
/// common
import 'common/global_config.dart';
import 'common/app.dart';
import 'common/intl/app_intl.dart';

/// index
import 'router/index_router.dart';
import 'provide/index_provide.dart';
/// page
import 'ui/home_index_page.dart';
import 'package:appaat_flutter/ui/login_page.dart';
///
import 'package:flutter_localizations/flutter_localizations.dart';



void main() async {

  GlobalConfig.initRouter(Router());

  runZoned(() {
    /// 强制竖屏
//    SystemChrome.setPreferredOrientations(
//            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
//        .then((_) {
      runApp(MultiProvider(
        providers: getProviders(),
        child: MyApp(),
      ));

      if (Platform.isAndroid) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
//    });

    PaintingBinding.instance.imageCache.maximumSize = 100;
  }, onError: (Object error, StackTrace stack) {
    print(error);
    print(stack);
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "优爆助手",
      theme: ThemeData(primaryColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: App.router.generator,
      //配置如下两个国际化的参数
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
//        DefaultCupertinoLocalizations.delegate,
        GermanCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("zh", "CH"),
        const Locale("en", "US")
      ],
      home: LoginPage("",""),
    );
  }
}
