// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_syn_sales_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesStatisticsModel _$SalesStatisticsModelFromJson(Map<String, dynamic> json) {
  return SalesStatisticsModel(
    json['tradeType'] as String,
    json['startTime'] as int,
    json['mom_startTime'] as int,
    json['mom_endTime'] as int,
    json['endTime'] as int,
    json['userId'] as int,
    (json['userStoreList'] as List)?.map((e) => e as String)?.toList(),
    (json['storeSalesList'] as List)
        ?.map((e) => e == null ? null : StoreSales.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['allSalesStatistics'] == null
        ? null
        : AllSalesStatistics.fromJson(json['allSalesStatistics'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SalesStatisticsModelToJson(SalesStatisticsModel instance) =>
    <String, dynamic>{
      'tradeType': instance.tradeType,
      'startTime': instance.startTime,
      'mom_startTime': instance.momStartTime,
      'mom_endTime': instance.momEndTime,
      'endTime': instance.endTime,
      'userId': instance.userId,
      'userStoreList': instance.userStoreList,
      'storeSalesList': instance.storeSalesList,
      'allSalesStatistics': instance.allSalesStatistics,
    };

StoreSales _$StoreSalesFromJson(Map<String, dynamic> json) {
  return StoreSales(
    (json['storeNo'] as dynamic).toString(),
    (json['buyAmount'] as dynamic).toString(),
    (json['mom_riseRate'] as dynamic).toString(),
    (json['salesAmount'] as dynamic).toString(),
    (json['goodsQuantity'] as dynamic).toString(),
    (json['storeName'] as dynamic).toString(),
    (json['orderQuantity'] as dynamic).toString(),
    (json['grossProfitRate'] as dynamic).toString(),
    (json['mom_salesAmount'] as dynamic).toString(),
    (json['perCustomerSales'] as dynamic).toString(),
    (json['jointRate'] as dynamic).toString(),
  );
}

Map<String, dynamic> _$StoreSalesToJson(StoreSales instance) => <String, dynamic>{
      'storeNo': instance.storeNo,
      'buyAmount': instance.buyAmount,
      'mom_riseRate': instance.momRiseRate,
      'salesAmount': instance.salesAmount,
      'goodsQuantity': instance.goodsQuantity,
      'storeName': instance.storeName,
      'orderQuantity': instance.orderQuantity,
      'grossProfitRate': instance.grossProfitRate,
      'mom_salesAmount': instance.momSalesAmount,
      'perCustomerSales': instance.perCustomerSales,
      'jointRate': instance.jointRate,
    };

AllSalesStatistics _$AllSalesStatisticsFromJson(Map<String, dynamic> json) {
  return AllSalesStatistics(
    (json['buyAmount'] as dynamic).toString(),
    (json['mom_riseRate'] as dynamic).toString(),
    (json['salesAmount'] as dynamic).toString(),
    (json['goodsQuantity'] as dynamic).toString(),
    (json['orderQuantity'] as dynamic).toString(),
    (json['grossProfitRate'] as dynamic).toString(),
    (json['mom_salesAmount'] as dynamic).toString(),
    (json['perCustomerSales'] as dynamic).toString(),
    (json['jointRate'] as dynamic).toString(),
  );
}

Map<String, dynamic> _$AllSalesStatisticsToJson(AllSalesStatistics instance) => <String, dynamic>{
      'buyAmount': instance.buyAmount,
      'mom_riseRate': instance.momRiseRate,
      'salesAmount': instance.salesAmount,
      'goodsQuantity': instance.goodsQuantity,
      'orderQuantity': instance.orderQuantity,
      'grossProfitRate': instance.grossProfitRate,
      'mom_salesAmount': instance.momSalesAmount,
      'perCustomerSales': instance.perCustomerSales,
      'jointRate': instance.jointRate,
    };
