import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

/// create by MZP 2019-08-29 16:33
/// 
/// 
///
/// 

@JsonSerializable()
class BaseModel extends Object {

  @JsonKey(name: 'status')
  bool status;

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'newUser')
  bool newUser;

  @JsonKey(name: 'data')
  String data;

  BaseModel(this.status,this.code,this.message,this.newUser,this.data,);

  factory BaseModel.fromJson(Map<String, dynamic> srcJson) => _$BaseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

}