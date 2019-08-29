import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
import 'package:appaat_flutter/common/base/base_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';

/// page
import 'package:appaat_flutter/ui/home/home_custom_time.dart';

/// entry
import 'package:appaat_flutter/entry/home_syn_sales_statistics.dart';

/// provide
import 'package:appaat_flutter/provide/home/synthetical_provider.dart';

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
            child: _createLeft(),
          ),
          Positioned(
            left: w(80) + 10,
            child: _createContent(),
          ),
          Positioned(
            right: 0,
            child: _createRight(),
          ),
        ],
      ),
    );
  }

  Column _createContent() {
    return Column(
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
    );
  }

  InkWell _createRight() {
    return InkWell(
      onTap: () {
        HomeCustomTime.start();
      },
      child: Image(
        width: w(80),
        height: h(80),
        image: assetImageXX('home/btn_time_check'),
      ),
    );
  }

  Image _createLeft() {
    return Image(
      width: w(80),
      height: h(80),
      image: assetImageXX('home/logo_rad'),
    );
  }
}

/// 数据表格
class SalesTableWidget extends BaseStatelessWidget {
  var tableTitle = [
    "销售额",
    "环比销售额",
    "环比增长率",
    "商品销量",
    "订单数",
    "客单价",
    "连带率",
    "毛利率"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          _tableWidget(),
          Text(
            '*点击门店名称查看该店日期范围内销售明细',
            style: TextStyle(
                fontSize: ResSize.text_content_hint_12,
                color: ResColors.app_main),
          ),
        ],
      ),
    );
  }

  Widget _tableWidget() {
    return Consumer<HomeSyntheticalProvider>(
      builder: (context, p, child) {
        List<StoreSales> listData = p.salesStatistics.storeSalesList;
        double height = (listData.length + 1) * 50.0;
        return Row(
          children: <Widget>[
            Container(
              width: 70,
              height: height,
              child: _tableLeftLab(listData),
            ),
            Container(
              width: screenDpW - 70,
              height: height,
              child: _tableRightScroll(listData),
            ),
          ],
        );
      },
    );
  }

  ListView _tableLeftLab(List<StoreSales> list) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length + 1,
      itemBuilder: (BuildContext context, int index) {
        bool isTitle = index == 0;
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 4, right: 4),
          color: isTitle ? ResColors.app_main : ResColors.yellow_light,
          height: 50,
          child: Text(
            isTitle ? '店铺' : '${list[index - 1].storeName}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isTitle ? ResColors.white : ResColors.text_dark),
          ),
        );
      },
    );
  }

  Widget _tableRightScroll(List<StoreSales> list) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: tableTitle.length * 90.0,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length + 1,
          itemBuilder: (BuildContext context, int index) {
            bool isRed = index == 1;
            bool isGreen = index == 2;

            List<SalesTableModel> itemList = [];
//            itemList
//                .add(SalesTableModel(true, Colors.white, tableTitle[index]));
            Color textColor = ResColors.text_dark;

            if (isRed) {
              textColor = ResColors.app_main;
            } else if (isGreen) {
              textColor = ResColors.hint_green;
            }
            bool isTitle = index == 0;
            if (isTitle) {
              for (int i = 0; i < tableTitle.length; i++) {
                var it = tableTitle[i];
                itemList.add(
                    SalesTableModel(isTitle, textColor, '$it'));
              }
            } else {
              var it = list[index - 1];
              itemList.add(SalesTableModel(isTitle, textColor, '${it.buyAmount}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.momRiseRate}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.salesAmount}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.goodsQuantity}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.orderQuantity}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.grossProfitRate}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.momSalesAmount}'));
              itemList.add(SalesTableModel(isTitle, textColor, '${it.perCustomerSales}'));
//              itemList.add(SalesTableModel(isTitle, textColor, '${it.jointRate}'));
            }
            return _createItems(itemList);
          },
        ),
      ),
    );
  }

  /// ["销售额","环比销售额","环比增长率","商品销量","订单数","客单价","连带率","毛利率"]
  /// 创建一列数据
  Widget _createItems(List<SalesTableModel> list) {
    return Row(
      children: list.map((it) {
        return _item(it);
      }).toList(),
    );
  }

  /// item
  Widget _item(SalesTableModel it) {
    bool isTitle = it.isTitle;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 4, right: 4),
      color: isTitle ? ResColors.app_main : ResColors.white,
      height: 50,
      width: 90,
      child: Text(
        '${it.textContent}',
        textAlign: TextAlign.center,
        style: TextStyle(color: isTitle ? ResColors.white : it.textColor),
      ),
    );
  }
}

class SalesTableModel {
  bool isTitle = false;
  Color textColor;
  String textContent = '-';

  SalesTableModel(this.isTitle, this.textColor, this.textContent);
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
      new LinearSales('易县1店', 1000),
      new LinearSales('易县2店', 2000),
      new LinearSales('易县3店', 3000),
      new LinearSales('易县4店', 4000),
    ];

    final mobileSalesData = [
      new LinearSales('比如世界', 200),
      new LinearSales('叮当测试分店1', 200),
      new LinearSales('中央仓', 1000),
      new LinearSales('易县1店', 1000),
      new LinearSales('易县2店', 2000),
      new LinearSales('易县3店', 3000),
      new LinearSales('易县4店', 4000),
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
