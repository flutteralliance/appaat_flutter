import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appaat_flutter/common/base/base_widget.dart';
import 'package:flutter/rendering.dart';

/// Example of a numeric combo chart with two series rendered as bars, and a
/// third rendered as a line.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';

/// create by MZP 2019-08-28 15:20
///
/// 首页-综合看板-销售统计-Widget
///
///

/// 时间选择
class SalesTimeWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: h(140),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            child: Image(
              width: w(80),
              height: h(80),
              image: assetImageXX('home/logo_rad'),
            ),
          ),
          Positioned(
            left: w(80) + 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '选中时间:',
                  style: TextStyle(fontSize: ResSize.text_content),
                ),
                Text(
                  '环比时间:',
                  style: TextStyle(
                    color: ResColors.app_main,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Image(
              width: w(80),
              height: h(80),
              image: assetImageXX('home/btn_time_check'),
            ),
          ),
        ],
      ),
    );
  }
}

/// 数据表格
class SalesTableWidget extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: ResColors.white,
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            Text('店铺'),
          ],
        )
      ]),
    ));
  }
}

/// 统计分析
class SalesStatisticsWidget extends BaseStatelessWidget {
  final List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

//  SalesStatisticsWidget(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
//  factory SalesStatisticsWidget.withSampleData() {
//    return SalesStatisticsWidget(
//      _createSampleData(),
//      // Disable animations for image tests.
//      animate: false,
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 10),
      child: charts.OrdinalComboChart(seriesList,
          animate: animate,
          // Configure the default renderer as a line renderer. This will be used
          // for any series that does not define a rendererIdKey.
          defaultRenderer: new charts.LineRendererConfig(),
          // Custom renderer configuration for the bar series.
          customSeriesRenderers: [
            new charts.BarRendererConfig(
                cornerStrategy: const charts.ConstCornerStrategy(30),
                // ID used to link series to this renderer.
                customRendererId: 'customBar')
          ]),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> _createSampleData() {

    final tableSalesData = [
      new LinearSales('比如世界', 123),
      new LinearSales('叮当测试分店1', 567),
      new LinearSales('中央仓', 8888),
      new LinearSales('易县1店', 1175),
      new LinearSales('易县1店', 1175),
      new LinearSales('易县1店', 1175),
      new LinearSales('易县1店', 1175),
    ];

    final mobileSalesData = [
      new LinearSales('比如世界', 200),
      new LinearSales('叮当测试分店1', 200),
      new LinearSales('中央仓', 1000),
      new LinearSales('易县1店', 3000),
      new LinearSales('易县1店', 3000),
      new LinearSales('易县1店', 3000),
      new LinearSales('易县1店', 3000),
    ];

    return [
//      new charts.Series<LinearSales, int>(
//        id: 'Desktop',
//        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: desktopSalesData,
//      )
//        // Configure our custom bar renderer for this series.
//        ..setAttribute(charts.rendererIdKey, 'customBar'),
      new charts.Series<LinearSales, String>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.labName,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: tableSalesData,
      )
        // Configure our custom bar renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customBar'),
      new charts.Series<LinearSales, String>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.labName,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: mobileSalesData),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String labName;
  final int sales;

  LinearSales(this.labName, this.sales);
}
