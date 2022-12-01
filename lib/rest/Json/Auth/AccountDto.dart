import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AccountDto {
  String type;
  String address;
  // KeysDto Pub_key { get; set; }
  int account_number;
  int sequence;

  AccountDto(this.type, this.address, this.account_number, this.sequence);

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
