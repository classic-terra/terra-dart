import 'package:terra_dart/src/Client/Lcd/Api/TxBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/LCDClient.dart';
import 'package:terra_dart/src/Key/Extensions/Key.dart';

class Wallet {
  final LcdClient lcd;
  final Key key;
  final String accAddress;
  final TxBroadcastAPI broadcastTx;

  Wallet(this.lcd, this.key, this.accAddress, this.broadcastTx);

  Future<Map<double, double>> getAccountNumberAndSequence() {
    throw Exception();
  }

  Future<double> getAccountNumber() {
    throw Exception();
  }

  Future<double> getSequence() {
    throw Exception();
  }
}
