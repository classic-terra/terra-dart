// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TxInfoLogsJSON.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TxInfoLogsJSON _$TxInfoLogsJSONFromJson(Map<String, dynamic> json) =>
    TxInfoLogsJSON(
      json['msg_index'] as int,
      json['log'] as String,
      (json['events'] as List<dynamic>)
          .map((e) => TxInfoEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TxInfoLogsJSONToJson(TxInfoLogsJSON instance) =>
    <String, dynamic>{
      'msg_index': instance.msg_index,
      'log': instance.log,
      'events': instance.events,
    };
