// import 'Coin.dart';
// import 'coin.dart';

// class PolicyConstraints {
//   Coin cap;
//   double rateMin;
//   double rateMax;
//   double changeRateMax;

//   PolicyConstraints(this.rateMin, this.rateMax, this.cap, this.changeRateMax);

//   static PolicyConstraints fromAmino(PolicyConstraintsAminoArgs data) {
//     return PolicyConstraints(
//         double.parse(data.rateMin!),
//         double.parse(data.rateMax!),
//         Coin.fromAmino(data.cap!),
//         double.parse(data.changeRateMax!));
//   }

//   static PolicyConstraints fromData(PolicyConstraintsDataArgs data) {
//     return PolicyConstraints(
//         double.parse(data.rateMin!),
//         double.parse(data.rateMax!),
//         Coin.fromData(data.cap!),
//         double.parse(data.changeRateMax!));
//   }

//   //  static PolicyConstraints FromProto(PROTO.PolicyConstraints data)
//   // {
//   //     return new PolicyConstraints(
//   //        decimal.Parse(data.RateMin),
//   //        decimal.Parse(data.RateMax),
//   //         Coin.FromProto(data.Cap),
//   //         decimal.Parse(data.ChangeRateMax));
//   // }

//   PolicyConstraintsAminoArgs toAmino() {
//     return PolicyConstraintsAminoArgs()
//       ..cap = cap.toAmino()
//       ..changeRateMax = changeRateMax.toString()
//       ..rateMax = rateMax.toString()
//       ..rateMin = rateMin.toString();
//   }

//   PolicyConstraintsDataArgs toData() {
//     return PolicyConstraintsDataArgs()
//       ..cap = cap.toData()
//       ..changeRateMax = changeRateMax.toString()
//       ..rateMax = rateMax.toString()
//       ..rateMin = rateMin.toString();
//   }

//   //  PROTO.PolicyConstraints ToProtoWithType()
//   // {
//   //     return new PROTO.PolicyConstraints()
//   //     {
//   //         Cap = this.cap.ToProtoWithType(),
//   //         ChangeRateMax = this.change_rate_max.ToString(),
//   //         RateMax = this.rate_max.ToString(),
//   //         RateMin = this.rate_min.ToString()
//   //     };
//   // }

//   //  byte[] ToProto()
//   // {
//   //     return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
//   // }
// }

// class PolicyConstraintsCommonArgs {
//   String? rateMin;
//   String? rateMax;
//   String? changeRateMax;
// }

// class PolicyConstraintsAminoArgs extends PolicyConstraintsCommonArgs {
//   CoinAminoArgs? cap;
// }

// class PolicyConstraintsDataArgs extends PolicyConstraintsCommonArgs {
//   CoinDataArgs? cap;
// }
