// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) {
  return BaseModel(
    json['status'] as bool,
    json['code'] as String,
    json['message'] as String,
    json['newUser'] as bool,
    json['data'] as String,
  );
}

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'newUser': instance.newUser,
      'data': instance.data,
    };
