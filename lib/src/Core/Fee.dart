import 'Coin.dart';
import 'Extensions/CoinExtensions.dart';

class Fee {
  List<Coin> amount;
  double gas_limit;
  String? payer;
  String? granter;

  Fee(this.gas_limit, this.amount, this.payer, this.granter);

  FeeAminoArgs toAmino() {
    return FeeAminoArgs()
      ..gas = gas_limit.toString()
      ..amount = CoinsExtensions.toAmino(amount);
  }

  FeeDataArgs toData() {
    return FeeDataArgs()
      ..payer = payer
      ..granter = granter
      ..gas_Limit = gas_limit.toString()
      ..amount = CoinsExtensions.toData(amount);
  }

  //  byte[] ToProto()
  // {
  //     return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
  // }

  // public COMB.Fee ToProtoWithType()
  // {
  //     return new COMB.Fee()
  //     {
  //         GasLimit = (ulong)this.gas_limit,
  //         Granter = this.granter,
  //         Payer = this.payer,
  //         Amounts = this.amount.ConvertAll(w => w.ToProtoWithType())
  //     };
  // }

  // static Fee fromJSON(TxFee data) {
  //   return new Fee(
  //       data.gas_limit,
  //       CoinsExtensions.fromJSON(data.amount).ToList(),
  //       data.payer,
  //       data.granter);
  // }

  static Fee fromAmino(FeeAminoArgs data) {
    return Fee(double.parse(data.gas!), CoinsExtensions.fromAmino(data.amount!),
        "", "");
  }

  static Fee fromData(FeeDataArgs data) {
    return Fee(double.parse(data.gas_Limit!),
        CoinsExtensions.fromData(data.amount!), data.payer, data.granter);
  }

  // static Fee FromProto(COMB.Fee data) {
  //   return new Fee(
  //       data.GasLimit,
  //       CoinsExtensions.FromProto(data.Amounts).ToList(),
  //       data.Payer,
  //       data.Granter);
  // }

  List<Coin> getGasPrices() {
    return amount.map((w) => w.toDecCoin().div(gas_limit)).toList();
  }
  //  TxFee ToJson()
  // {
  //     return new TxFee()
  //     {
  //         amount = CoinsExtensions.ToJSON(this.amount).ToArray(),
  //         gas_limit = this.gas_limit,
  //         granter = this.granter,
  //         payer = this.payer
  //     };
  // }
}

class FeeAminoArgs {
  String? gas;
  List<CoinAminoArgs>? amount;
}

class FeeDataArgs {
  String? gas_Limit;
  String? payer;
  String? granter;
  List<CoinDataArgs>? amount;
}
