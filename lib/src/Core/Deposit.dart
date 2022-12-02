// import 'Coin.dart';
// import 'Extensions/CoinExtensions.dart';

// class Deposit {
//   double proposal_id;
//   String depositor;
//   List<Coin> amount;

//   Deposit(this.proposal_id, this.depositor, this.amount);

//   static Deposit fromAmino(DepositAminoArgs data) {
//     return Deposit(double.parse(data.proposalId!), data.depositor!,
//         CoinsExtensions.fromAmino(data.amount!));
//   }

//   static Deposit fromData(DepositDataArgs data) {
//     return Deposit(double.parse(data.proposalId!), data.depositor!,
//         CoinsExtensions.fromData(data.amount!));
//   }

//   //  static Deposit FromProto(DEP_COMB.Deposit data)
//   // {
//   //     return new Deposit(data.ProposalId, data.Depositor, CoinsExtensions.FromProto(data.Amounts).ToList());
//   // }

//   // static Deposit fromJSON(ProposalDepositsJSON data) {
//   //   return new Deposit(double.Parse(data.proposal_id), data.depositor,
//   //       CoinsExtensions.FromJSON(data.amount).ToList());
//   // }

//   // static Deposit FromJSON(TxBodyJSONMessages data) {
//   //   return new Deposit(data.proposal_id, data.depositor,
//   //       CoinsExtensions.FromJSON(data.amount).ToList());
//   // }

//   //  byte[] ToProto()
//   // {
//   //     return ProtoExtensions.SerialiseFromData(new DEP_COMB.Deposit()
//   //     {
//   //         Depositor = depositor,
//   //         ProposalId = (ulong)proposal_id
//   //     });
//   // }

//   DepositDataArgs toData() {
//     return DepositDataArgs()
//       ..proposalId = "$proposal_id"
//       ..depositor = depositor
//       ..amount = CoinsExtensions.toData(amount);
//   }

//   DepositAminoArgs toAmino() {
//     return DepositAminoArgs()
//       ..proposalId = "$proposal_id"
//       ..depositor = depositor
//       ..amount = CoinsExtensions.toAmino(amount);
//   }

//   // public static Deposit UnPackAny(Any msgAny)
//   // {
//   //     return FromProto(ProtoExtensions.DeserialiseFromBytes<DEP_COMB.Deposit>(msgAny.Value));
//   // }
// }

// class DepositAminoArgs {
//   String? proposalId;
//   String? depositor;
//   List<CoinAminoArgs>? amount;
// }

// class DepositDataArgs {
//   String? proposalId;
//   String? depositor;
//   List<CoinDataArgs>? amount;
// }
