import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appaat_flutter/res/index_res.dart';

/// common
import 'package:appaat_flutter/common/global_config.dart';

///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/5 6:00 PM
///     desc   : 渐变按钮
///     version: 1.0
/// </pre>
///
class GradientRedButton extends StatelessWidget {
  final _name;
  final double width;
  final double height;
  final Color startColor; //渐变开始颜色
  final Color endColor; //渐变结束颜色
  final double fontSize; //内容文字大小
  final GestureTapCallback onTap; //点击事件
  final Color textColor; // 内容文字颜色
  final bool showBoxShadow; // 是否显示阴影

  GradientRedButton(this._name,
      {this.width = screenWidth - 32,
      this.height = 60,
      this.startColor = ResColors.red_fe,
      this.endColor = ResColors.red_e2,
      this.fontSize = 32,
      this.textColor = Colors.white,
      this.showBoxShadow = true,
      this.onTap})
      : super();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          //背景渐变
          gradient: LinearGradient(colors: [startColor, endColor]),
          //圆角
          borderRadius: BorderRadius.circular(44),
          //阴影
          boxShadow: showBoxShadow
              ? [
                  BoxShadow(
                      color: ResColors.text_dark,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0)
                ]
              : [],
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: ScreenUtil.getInstance().setWidth(width),
            height: ScreenUtil.getInstance().setHeight(height),
            alignment: Alignment.center,
            child: Text(
              _name,
              style: TextStyle(
                color: textColor,
                fontSize: ScreenUtil.getInstance().setSp(fontSize),
              ),
            ),
          ),
        ));
  }
}
