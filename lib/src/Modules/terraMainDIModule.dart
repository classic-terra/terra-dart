import 'package:terra_dart/src/Client/Lcd/Api/authAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/authzAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/bankAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/distributionAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/feeGrantAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/govAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/ibcAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/ibcTransferAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/marketAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/mintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/oracleAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/slashingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/stakingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/tXAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/tendermintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/treasuryAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/txBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/Api/wasmAPI.dart';
import 'package:terra_dart/src/Client/Lcd/LocalTerra/localTerra.dart';

import '../../rest/services/terraRestfulService.dart';
import '../Client/Lcd/lcdClient.dart';
import '../TerraStartup.dart';

class TerraMainDIModule {
  static void load() {
    _registerApiServices();
    _registerLCDServices();
  }

  static void _registerApiServices() {
    var http = TerraStartup.injector.get<TerraRestfulService>();
    TerraStartup.injector.registerSingleton<AuthAPI>(() => AuthAPI(http));
    TerraStartup.injector.registerSingleton<AuthzAPI>(() => AuthzAPI());
    TerraStartup.injector.registerSingleton<BankAPI>(() => BankAPI(http));
    TerraStartup.injector
        .registerSingleton<DistributionAPI>(() => DistributionAPI(http));
    TerraStartup.injector
        .registerSingleton<FeeGrantAPI>(() => FeeGrantAPI(http));
    TerraStartup.injector.registerSingleton<GovAPI>(() => GovAPI(http));
    TerraStartup.injector.registerSingleton<IBCAPI>(() => IBCAPI());
    TerraStartup.injector
        .registerSingleton<IBCTransferAPI>(() => IBCTransferAPI());
    TerraStartup.injector.registerSingleton<MarketAPI>(() => MarketAPI());
    TerraStartup.injector.registerSingleton<MintAPI>(() => MintAPI());
    TerraStartup.injector.registerSingleton<OracleAPI>(() => OracleAPI());
    TerraStartup.injector.registerSingleton<SlashingAPI>(() => SlashingAPI());
    TerraStartup.injector.registerSingleton<StakingAPI>(() => StakingAPI());
    TerraStartup.injector.registerSingleton<TreasuryAPI>(() => TreasuryAPI());
    TerraStartup.injector
        .registerSingleton<TendermintAPI>(() => TendermintAPI());
    TerraStartup.injector.registerSingleton<TxAPI>(() => TxAPI());
    TerraStartup.injector
        .registerSingleton<TxBroadcastAPI>(() => TxBroadcastAPI());
    TerraStartup.injector.registerSingleton<WasmAPI>(() => WasmAPI());
  }

  static void _registerLCDServices() {
    var auth = TerraStartup.injector.get<AuthAPI>();
    var authz = TerraStartup.injector.get<AuthzAPI>();
    var bank = TerraStartup.injector.get<BankAPI>();
    var distribution = TerraStartup.injector.get<DistributionAPI>();
    var feeGrant = TerraStartup.injector.get<FeeGrantAPI>();
    var gov = TerraStartup.injector.get<GovAPI>();
    var ibc = TerraStartup.injector.get<IBCAPI>();
    var ibcTransfer = TerraStartup.injector.get<IBCTransferAPI>();
    var marketApi = TerraStartup.injector.get<MarketAPI>();
    var mint = TerraStartup.injector.get<MintAPI>();
    var oracle = TerraStartup.injector.get<OracleAPI>();
    var slashing = TerraStartup.injector.get<SlashingAPI>();
    var staking = TerraStartup.injector.get<StakingAPI>();
    var tendermint = TerraStartup.injector.get<TendermintAPI>();
    var treasury = TerraStartup.injector.get<TreasuryAPI>();
    var tx = TerraStartup.injector.get<TxAPI>();
    var txBroadcast = TerraStartup.injector.get<TxBroadcastAPI>();
    var wasm = TerraStartup.injector.get<WasmAPI>();

    TerraStartup.injector.registerSingleton<LcdClient>(() {
      return LcdClient(
          auth,
          authz,
          bank,
          distribution,
          feeGrant,
          gov,
          ibc,
          ibcTransfer,
          marketApi,
          mint,
          oracle,
          slashing,
          staking,
          tendermint,
          treasury,
          tx,
          txBroadcast,
          wasm);
    });
    TerraStartup.injector.registerSingleton<LocalTerra>(() {
      return LocalTerra(
          auth,
          authz,
          bank,
          distribution,
          feeGrant,
          gov,
          ibc,
          ibcTransfer,
          marketApi,
          mint,
          oracle,
          slashing,
          staking,
          tendermint,
          treasury,
          tx,
          txBroadcast,
          wasm);
    });
  }
}
