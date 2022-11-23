import 'package:terra_dart/src/Client/Lcd/Api/TxBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/LCDClient.dart';
import 'package:terra_dart/src/Key/Extensions/Key.dart';

class Wallet {
  Wallet(LcdClient lcd, Key key, String accAddress, TxBroadcastAPI broadcastTx);

  Future<Map<double, double>> getAccountNumberAndSequence() {
    throw new Exception();
  }

  Future<double> getAccountNumber() {
    throw new Exception();
  }

  Future<double> getSequence() {
    throw new Exception();
  }
}
