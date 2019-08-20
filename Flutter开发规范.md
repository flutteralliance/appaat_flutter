### Dart 开发规范

#### 命名规则

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

### Flutter 开发规范

#### 文件

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
	* |--personter
	* |--provide
	* |--res
	* |--router
	* |--test
	* |--ui
	* |--widget