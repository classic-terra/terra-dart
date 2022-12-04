import '../../../../../rest/Json/IBC/ConsensusStateJSON.dart';
import 'Height.dart';

class ConsensusStateWithHeight {
  final Height height;
  final ConsensusStateJSON consensus_state;

  ConsensusStateWithHeight(this.height, this.consensus_state);

  static ConsensusStateWithHeight fromData(
      ConsensusStateWithHeightCommonArgs data) {
    return ConsensusStateWithHeight(
        Height.fromData(data.height!), data.consensus_State!);
  }

  ConsensusStateWithHeightCommonArgs toData() {
    return ConsensusStateWithHeightCommonArgs()
      ..height = height.toData()
      ..consensus_State = consensus_state;
  }
  //  static ConsensusStateWithHeight FromJSON(IBCApiConsensusState data)
  // {
  //     return new ConsensusStateWithHeight(
  //         Height.FromJSON(data.height),
  //         data.consensus_state);
  // }

  //  PROTO.ConsensusStateWithHeight ToProtoWithType()
  // {
  //     return new PROTO.ConsensusStateWithHeight()
  //     {
  //         Height = this.height.ToProtoWithType(),
  //     };
  // }

  //  byte[] ToProto()
  // {
  //     return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
  // }
}

class ConsensusStateWithHeightCommonArgs {
  HeightDataArgs? height;
  ConsensusStateJSON? consensus_State;
}
