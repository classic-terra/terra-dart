// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WasmContainer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WasmContainer _$WasmContainerFromJson(Map<String, dynamic> json) =>
    WasmContainer(
      WasmCodeInfo.fromJson(json['code_info'] as Map<String, dynamic>),
      WasmContractInfo.fromJson(json['contract_info'] as Map<String, dynamic>),
      json['query_result'] as String,
      WasmParams.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WasmContainerToJson(WasmContainer instance) =>
    <String, dynamic>{
      'code_info': instance.code_info,
      'contract_info': instance.contract_info,
      'query_result': instance.query_result,
      'params': instance.params,
    };
