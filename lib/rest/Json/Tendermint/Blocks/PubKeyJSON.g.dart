// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PubKeyJSON.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PubKeyJSON _$PubKeyJSONFromJson(Map<String, dynamic> json) => PubKeyJSON(
      json['ed25519'] as String,
      json['secp256k1'] as String,
    );

Map<String, dynamic> _$PubKeyJSONToJson(PubKeyJSON instance) =>
    <String, dynamic>{
      'ed25519': instance.ed25519,
      'secp256k1': instance.secp256k1,
    };
