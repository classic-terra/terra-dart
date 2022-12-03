import 'package:terra_dart/src/Client/Lcd/Api/txBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/lcdClient.dart';
import 'package:terra_dart/src/Key/Extensions/Key.dart';

class Wallet {
  final LcdClient lcd;
  //final Key key;
  final String accAddress;
  final TxBroadcastAPI broadcastTx;

  Wallet(this.lcd, this.accAddress, this.broadcastTx);

  Future<Map<double, double>> getAccountNumberAndSequence() {
    throw Exception();
  }

  Future<int> getAccountNumber() async {
    var response = await lcd.auth.getAccountInfoWalletAddress(accAddress);
    return response.account_number;
  }

  Future<int> getSequence() async {
    var response = await lcd.auth.getAccountInfoWalletAddress(accAddress);
    return response.sequence;
  }
}
