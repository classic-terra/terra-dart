import 'dart:developer';

import 'package:terra_dart/src/Configuration/Environment/TerraEnvironment.dart';
import 'package:terra_dart/src/Constants/preconfiguredWallets.dart';
import 'package:terra_dart/src/TerraStartup.dart';
import 'package:terra_dart/terra_dart.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    TerraStartup.initializeKernel(TerraEnvironment.classic);

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () async {
      var lcd = TerraStartup.getLCDClient();
      // var wallet = TerraStartup.getLCDClient()
      //     .createWallet("terra1x46rqay4d3cssq8gxxvqz8xt6nwlz4td20k38v");
      var rewards = await lcd.distribution
          .getRewards(PreconfiguredWallets.TEST_NET_WALLET);
      var val = await lcd.distribution.getValidatorCommission(
          "terravaloper1259cmu5zyklsdkmgstxhwqpe0utfe5hhyty0at");
      var c = await lcd.distribution
          .getWithdrawAddress(PreconfiguredWallets.TEST_NET_WALLET);
      var t = await lcd.distribution.getCommunityPool();

      var r = await lcd.distribution.getParams();

      print("");
    });
  });
}
