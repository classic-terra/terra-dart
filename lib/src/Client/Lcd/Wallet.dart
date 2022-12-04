import 'package:terra_dart/src/Client/Lcd/Api/txBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/lcdClient.dart';
import 'package:terra_dart/src/Key/Extensions/Key.dart';

class Wallet {
  final LcdClient _lcd;
  //final Key key;
  final String accAddress;
  final TxBroadcastAPI _broadcastTx;

  Wallet(this._lcd, this.accAddress, this._broadcastTx);

  Future<Map<double, double>> getAccountNumberAndSequence() {
    throw Exception();
  }

  Future<int> getAccountNumber() async {
    var response = await _lcd.auth.getAccountInfoWalletAddress(accAddress);
    return int.parse(response.account_number!);
  }

  Future<int> getSequence() async {
    var response = await _lcd.auth.getAccountInfoWalletAddress(accAddress);
    return int.parse(response.sequence!);
  }
}
