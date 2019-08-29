///
/// <pre>
///     author : Wp
///     e-mail : 1101313414@qq.com
///     time   : 2019/7/7 8:35 PM
///     desc   : 接口请求方法全局常量
///     version: 1.0
/// </pre>
///
class Api {
  static const String BASE_URL = 'http://dev.dingdian.xin/';
  ///登录
  static const String LOGIN_URL = '/ddaigo-platform/user/loginv3';
  ///获取门店信息
  static const String getStoreByNo = '/ddaigo-platform/store/getStoreByNo';  
  ///顾客退货列表
  static const String orders = '/ddaigo-platform/store/returned/orders';
}
