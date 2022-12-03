import 'package:terra_dart/src/Configuration/Environment/TerraEnvironment.dart';
import 'package:terra_dart/src/TerraStartup.dart';
import 'package:terra_dart/terra_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    TerraStartup.initializeKernel(TerraEnvironment.classicTestNet);

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () async {
      var wallet = TerraStartup.getLCDClient()
          .createWallet("terra1x46rqay4d3cssq8gxxvqz8xt6nwlz4td20k38v");
      var dto =
          await wallet.lcd.auth.getAccountInfoWalletAddress(wallet.accAddress);

      print("SEQUENCE ${dto.sequence}");
      print("Account Number ${dto.account_number}");
      print("Public Key ${dto.pub_key}");
    });
  });
}
