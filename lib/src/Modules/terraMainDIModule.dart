import 'package:terra_dart/src/Client/Lcd/Api/AuthAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/AuthzAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/BankAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/DistributionAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/FeeGrantAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/GovAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/IBCAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/IBCTransferAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/MarketAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/MintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/OracleAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/SlashingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/StakingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TXAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TendermintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TxBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/Api/WasmAPI.dart';
import 'package:terra_dart/src/Client/Lcd/LCDClient.dart';

import '../TerraStartup.dart';

class TerraMainDIModule {
  static void load() {
    _registerApiServices();
    _registerLCDServices();
  }

  static void _registerApiServices() {
    TerraStartup.injector.registerSingleton<AuthAPI>(() => AuthAPI());
    TerraStartup.injector.registerSingleton<AuthzAPI>(() => AuthzAPI());
    TerraStartup.injector.registerSingleton<BankAPI>(() => BankAPI());
    TerraStartup.injector
        .registerSingleton<DistributionAPI>(() => DistributionAPI());
    TerraStartup.injector.registerSingleton<FeeGrantAPI>(() => FeeGrantAPI());
    TerraStartup.injector.registerSingleton<GovAPI>(() => GovAPI());
    TerraStartup.injector.registerSingleton<IBCAPI>(() => IBCAPI());
    TerraStartup.injector
        .registerSingleton<IBCTransferAPI>(() => IBCTransferAPI());
    TerraStartup.injector.registerSingleton<MarketAPI>(() => MarketAPI());
    TerraStartup.injector.registerSingleton<MintAPI>(() => MintAPI());
    TerraStartup.injector.registerSingleton<OracleAPI>(() => OracleAPI());
    TerraStartup.injector.registerSingleton<SlashingAPI>(() => SlashingAPI());
    TerraStartup.injector.registerSingleton<StakingAPI>(() => StakingAPI());
    TerraStartup.injector
        .registerSingleton<TendermintAPI>(() => TendermintAPI());
    TerraStartup.injector.registerSingleton<TxAPI>(() => TxAPI());
    TerraStartup.injector
        .registerSingleton<TxBroadcastAPI>(() => TxBroadcastAPI());
    TerraStartup.injector.registerSingleton<WasmAPI>(() => WasmAPI());
  }

  static void _registerLCDServices() {
    TerraStartup.injector.registerSingleton<LcdClient>(() => LcdClient());
  }
}
