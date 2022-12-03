// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValidatorDataArgsJSON.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatorDataArgsJSON _$ValidatorDataArgsJSONFromJson(
        Map<String, dynamic> json) =>
    ValidatorDataArgsJSON(
      ValConsPublicKeyCommonArgsJSON.fromJson(
          json['consensus_pubkey'] as Map<String, dynamic>),
      ValidatorDescriptionJSON.fromJson(
          json['description'] as Map<String, dynamic>),
      CommissionCommonArgsJSON.fromJson(
          json['commission'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidatorDataArgsJSONToJson(
        ValidatorDataArgsJSON instance) =>
    <String, dynamic>{
      'consensus_pubkey': instance.consensus_pubkey,
      'description': instance.description,
      'commission': instance.commission,
    };
