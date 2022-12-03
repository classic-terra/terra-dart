import 'package:json_annotation/json_annotation.dart';
import 'package:terra_dart/rest/Json/Tendermint/Blocks/BlockSignatures.dart';

import 'BlockInfo.dart';

part 'BlockHeaderCommit.g.dart';

@JsonSerializable()
class BlockHeaderCommit {
  final String height;
  final int round;
  final BlockInfo block_id;
  final List<BlockSignatures> signatures;

  BlockHeaderCommit(this.height, this.round, this.block_id, this.signatures);

  // /// Connect the generated [_$AccountDtoFromJson] function to the `fromJson`
  // /// factory.
  factory BlockHeaderCommit.fromJson(Map<String, dynamic> json) =>
      _$BlockHeaderCommitFromJson(json);

  /// Connect the generated [_$BlockHeaderCommitToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BlockHeaderCommitToJson(this);
}
