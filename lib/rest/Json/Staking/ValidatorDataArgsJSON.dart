import 'package:json_annotation/json_annotation.dart';

import 'CommissionCommonArgsJSON.dart';
import 'ValConsPublicKeyCommonArgsJSON.dart';
import 'ValidatorDescriptionJSON.dart';

part 'ValidatorDataArgsJSON.g.dart';

@JsonSerializable()
class ValidatorDataArgsJSON {
  final ValConsPublicKeyCommonArgsJSON consensus_pubkey;
  final ValidatorDescriptionJSON description;
  final CommissionCommonArgsJSON commission;

  ValidatorDataArgsJSON(
      this.consensus_pubkey, this.description, this.commission);

  // /// Connect the generated [_$AccountDtoFromJson] function to the `fromJson`
  // /// factory.
  factory ValidatorDataArgsJSON.fromJson(Map<String, dynamic> json) =>
      _$ValidatorDataArgsJSONFromJson(json);

  /// Connect the generated [_$ValidatorDataArgsJSONToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ValidatorDataArgsJSONToJson(this);
}
