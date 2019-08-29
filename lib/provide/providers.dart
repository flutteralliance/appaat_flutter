import 'package:provider/provider.dart';

/// provide
import 'home_provide.dart';
import 'home/synthetical_provider.dart';

///

/// create by MZP 2019-08-21 10:08
///
///
///
///

List<SingleChildCloneableWidget> getProviders() {
  return [
    ChangeNotifierProvider(builder: (_) => HomePageCarProvide(0)),
    ChangeNotifierProvider(builder: (_) => HomeSyntheticalProvider()),
//    ChangeNotifierProvider(builder: (_) => HomePageCategoryProvide([])),
//    ChangeNotifierProvider(builder: (_) => GoodsDetailProvide()),
  ];
}
