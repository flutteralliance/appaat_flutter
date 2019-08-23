### Dart 开发规范

#### 代码风格
+ 类、枚举、typedef和类型参数

```Dart
  class SliderMenu { ... }
  
  class HttpRequest { ... }
  
  typedef Predicate = bool Function<T>(T value);
```

+ 使用小驼峰法命名其他标识符

```Dart
  var item;
  
  HttpRequest httpRequest;
  
  void align(bool clearItems) {
    // ...
  }
```
#### 导入的包排序
+ 为了使你的文件前言保持整洁，我们有规定的命令，指示应该出现在其中。每个“部分”应该用空行分隔。

``` Dart
  import 'package:flutter/material.dart';

  /// index
  //export 'package:appaat_flutter/res/index_res.dart';
  export 'package:appaat_flutter/provide/index_provide.dart';
  export 'package:appaat_flutter/router/index_router.dart';

  /// app common
  import '../app.dart';
  export '../app.dart';

  /// utils
  import 'package:fluttertoast/fluttertoast.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:appaat_flutter/utils/dialog_utils.dart';
```

+ 不推荐

```Dart
  import 'src/error.dart';
  export 'src/error.dart';
  import 'src/foo_bar.dart';
```

#### 注释
```Dart
  /// Dart 推荐以 /// 的方式添加注释
  /// 刷新商品分类-详细商品数据-加载更多
  void onLoadRightItemList(List<CategoryGoods> list) {
    _currentRightPage++;
    _categoryGoodsList.addAll(list);
    notifyListeners();
  }
```


#### 变量
```Dart
  /// 私有变量 _开头
  int _rightSelectIndex = -1;
  /// 与其对应的get方法
  int get rightSelectIndex => _rightSelectIndex;
```

#### 回调
+ 如果只有一个方法, Dart推荐以闭包的方式

```Dart
/// 推荐
typedef Predicate<E> = bool Function(E element);

/// 不推荐
abstract class Predicate<E> {
  bool test(E element);
}
```

#### 链式调用
+ Dart 提供了方法级联来使用链式调用

```Dart
  /// 推荐
  var buffer = StringBuffer()
  ..write('one')
  ..write('two')
  ..write('three');
  
  /// 不推荐
  var buffer = StringBuffer()
    .write('one')
    .write('two')
    .write('three');
```

#### 初始化方法内部变量
+ 省略变量类型会将注意力集中在变量更重要名称及其初始化值上。

```Dart
  /// 推荐
  List<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {
    var desserts = <List<Ingredient>>[];
    for (var recipe in cookbook) {
      if (pantry.containsAll(recipe)) {
        desserts.add(recipe);
      }
    }

    return desserts;
  }
  
  /// 不推荐
  List<List<Ingredient>> possibleDesserts(Set<Ingredient> pantry) {
    List<List<Ingredient>> desserts = <List<Ingredient>>[];
    for (List<Ingredient> recipe in cookbook) {
      if (pantry.containsAll(recipe)) {
        desserts.add(recipe);
      }
    }

    return desserts;
  }
```

#### 不要在运算符中检查null
+ 只有在右侧不为空时才调用==方法。

```Dart
  /// 推荐
  class Person {
    final String name;
    // ···
    bool operator ==(other) => other is Person && name == other.name;

    int get hashCode => name.hashCode;
  }
  
  /// 不推荐
  class Person {
    final String name;
    // ···
    bool operator ==(other) => other != null && ...
  }
```

### Flutter 开发规范

#### 导入包

```Dart
import 'package:flutter/material.dart';

/// index
//export 'package:appaat_flutter/res/index_res.dart';
export 'package:appaat_flutter/provide/index_provide.dart';
export 'package:appaat_flutter/router/index_router.dart';
/// app common
import '../app.dart';
export '../app.dart';
/// utils
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appaat_flutter/utils/dialog_utils.dart';
```

#### 页面跳转
```Dart
  /// 推荐静态方法的方式
  static Future start(BuildContext context, String goodsId) {
    return App.navigateTo(context, "$GoodsDetail",
        params: {"goodsId": goodsId});
  }
```
#### 路由路径
+ 

#### 状态管理
+ 文件以模块命名的方式创建在 provide 包下


### Flutter 项目分包

#### 混合分包

#### Flutter项目
- |--lib
    * |--common
		* |-- common.base
	* |--entry
	* |--model
	* |--pages
	* |--provide
	* |--res
	* |--router
	* |--test
	* |--ui
	* |--widget