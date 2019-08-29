import 'package:json_annotation/json_annotation.dart';


part 'home_syn_sales_statistics.g.dart';

/// create by MZP 2019-08-29 16:31
/// 
/// 
///
///

@JsonSerializable()
class SalesStatisticsModel extends Object {

  @JsonKey(name: 'tradeType')
  String tradeType;

  @JsonKey(name: 'startTime')
  int startTime;

  @JsonKey(name: 'mom_startTime')
  int momStartTime;

  @JsonKey(name: 'mom_endTime')
  int momEndTime;

  @JsonKey(name: 'endTime')
  int endTime;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userStoreList')
  List<String> userStoreList;

  @JsonKey(name: 'storeSalesList')
  List<StoreSales> storeSalesList;

  @JsonKey(name: 'allSalesStatistics')
  AllSalesStatistics allSalesStatistics;

  SalesStatisticsModel(this.tradeType,this.startTime,this.momStartTime,this.momEndTime,this.endTime,this.userId,this.userStoreList,this.storeSalesList,this.allSalesStatistics,);

  factory SalesStatisticsModel.fromJson(Map<String, dynamic> srcJson) => _$SalesStatisticsModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SalesStatisticsModelToJson(this);

}


@JsonSerializable()
class StoreSales extends Object {

  @JsonKey(name: 'storeNo')
  String storeNo;

  @JsonKey(name: 'buyAmount')
  double buyAmount;

  @JsonKey(name: 'mom_riseRate')
  String momRiseRate;

  @JsonKey(name: 'salesAmount')
  double salesAmount;

  @JsonKey(name: 'goodsQuantity')
  int goodsQuantity;

  @JsonKey(name: 'storeName')
  String storeName;

  @JsonKey(name: 'orderQuantity')
  int orderQuantity;

  @JsonKey(name: 'grossProfitRate')
  String grossProfitRate;

  @JsonKey(name: 'mom_salesAmount')
  double momSalesAmount;

  @JsonKey(name: 'perCustomerSales')
  String perCustomerSales;

  @JsonKey(name: 'jointRate')
  String jointRate;


  bool isTitle = false;
  bool isLeftLab = false;
//  Colors textColors = false;


  StoreSales(this.storeNo,this.buyAmount,this.momRiseRate,this.salesAmount,this.goodsQuantity,this.storeName,this.orderQuantity,this.grossProfitRate,this.momSalesAmount,this.perCustomerSales,this.jointRate,);


  factory StoreSales.fromJson(Map<String, dynamic> srcJson) => _$StoreSalesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StoreSalesToJson(this);

}


@JsonSerializable()
class AllSalesStatistics extends Object {

  @JsonKey(name: 'buyAmount')
  double buyAmount;

  @JsonKey(name: 'mom_riseRate')
  String momRiseRate;

  @JsonKey(name: 'salesAmount')
  double salesAmount;

  @JsonKey(name: 'goodsQuantity')
  int goodsQuantity;

  @JsonKey(name: 'orderQuantity')
  int orderQuantity;

  @JsonKey(name: 'grossProfitRate')
  String grossProfitRate;

  @JsonKey(name: 'mom_salesAmount')
  double momSalesAmount;

  @JsonKey(name: 'perCustomerSales')
  String perCustomerSales;

  @JsonKey(name: 'jointRate')
  String jointRate;

  AllSalesStatistics(this.buyAmount,this.momRiseRate,this.salesAmount,this.goodsQuantity,this.orderQuantity,this.grossProfitRate,this.momSalesAmount,this.perCustomerSales,this.jointRate,);

  factory AllSalesStatistics.fromJson(Map<String, dynamic> srcJson) => _$AllSalesStatisticsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AllSalesStatisticsToJson(this);

}


