import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appaat_flutter/res/index_res.dart';


///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/8/5 6:00 PM
///     desc   : 渐变按钮
///     version: 1.0
/// </pre>
///
// ignore: must_be_immutable
class GradientRedButton extends StatelessWidget {
  final _name;
  double _width;
  double _height;


  GradientRedButton(this._name,this._width,this._height) : super();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [ResColors.red_fe, ResColors.red_e2]),
            //背景渐变
            borderRadius: BorderRadius.circular(44),
            //3像素圆角
            boxShadow: [
              //阴影
              BoxShadow(
                  color: ResColors.text_dark,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2.0)
            ]),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(_width),
          height: ScreenUtil.getInstance().setWidth(_height),
          alignment: Alignment.center,
          child: Text(
            _name,
            style: TextStyle(color: Colors.white,fontSize: ScreenUtil.getInstance().setSp(32)),
          ),
        ));
  }
}
