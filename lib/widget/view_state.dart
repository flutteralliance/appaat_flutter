import 'package:flutter/material.dart';

///
import 'package:appaat_flutter/res/index_res.dart';

/// widget
import 'spinkit/ripple.dart';
import 'package:shimmer/shimmer.dart';

/// create by MZP 2019-08-26 14:53
///
/// 用于展示页面各种状态下的 widget
///
///

typedef SuccessWidgetBuilder<T> = Widget Function(
    BuildContext context, AsyncSnapshot<T> snapshot);

class FutureState<T> extends FutureBuilder {
  final SuccessWidgetBuilder successBuilder;

  final ViewState loadingType;

  FutureState(
      {this.loadingType = ViewState.loading,
      future,
      @required this.successBuilder})
      : super(
            future: future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  // 显示正在加载
                  return loadingType == ViewState.loading
                      ? loadingWidget
                      : loadingShimmerWidget;
                case ConnectionState.done:
                  // 提示错误信息
                  if (snapshot.hasError) {
                    return emptyCenterWidget(snapshot.error.toString());
                  }
                  if (!snapshot.hasData) {
                    return emptyCenterWidget('内容空');
                  }
                  // 展示列表内容
                  return successBuilder(context, snapshot);
                default:
                  return emptyCenterWidget('404');
              }
            });
}

enum ViewState {
  /// 进度条
  loading,

  /// 骨架屏
  shimmer,

  /// 内容空时的提示
  empty,

  /// 错误信息, 通常与点击重试功能一起使用
  error,
}

/// 无数据
Widget emptyCenterWidget(String msg) =>
    Center(child: Text(msg.isEmpty ? "内容空" : msg));

Widget get loadingShimmerWidget => SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        baseColor: Colors.grey[350],
        highlightColor: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: List.generate(6, (index) => ArticleSkeletonItem()),
          ),
        ),
      ),
    );

/// 进度条
Widget get loadingWidget =>
    Center(child: SpinKitRipple(color: ResColors.app_main));

/// TODO 错误信息, 点击重试

/// TODO 未登录页面

/// 骨架屏
class ArticleSkeletonItem extends StatelessWidget {
  final int index;

  ArticleSkeletonItem({this.index: 0});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
//    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isDark = false;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: Divider.createBorderSide(context,
                  width: 0.7, color: Colors.redAccent))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 20,
                width: 20,
                decoration: SkeletonDecoration(isCircle: true, isDark: isDark),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 5,
                width: 100,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                height: 5,
                width: 30,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
            ],
          ),
          SizedBox(
            height: 0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                height: 6.5,
                width: width * 0.7,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 6.5,
                width: width * 0.8,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 6.5,
                width: width * 0.5,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                height: 8,
                width: 20,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              Container(
                height: 8,
                width: 80,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                height: 20,
                width: 20,
                decoration: SkeletonDecoration(isDark: isDark),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 骨架屏 元素背景 ->形状及颜色
class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    isCircle: false,
    isDark: false,
  }) : super(
          color: !isDark ? Colors.grey[350] : Colors.grey[700],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}
