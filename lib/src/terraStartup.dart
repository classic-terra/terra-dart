import 'package:injector/injector.dart';
import 'package:terra_dart/src/Client/Lcd/LocalTerra/localTerra.dart';
import 'package:terra_dart/src/Configuration/Environment/TerraEnvironment.dart';
import 'package:terra_dart/src/Modules/terraMainDIModule.dart';
import 'Client/Lcd/LCDClient.dart';
import 'Client/Lcd/LCDDefaultConfigs.dart';
import 'Client/Lcd/Models/LCDClientConfig.dart';
import 'Configuration/Environment/TerraClientConfiguration.dart';
import 'Constants/Classic/ClassicChainKeys.dart';
import 'Constants/Classic/ClassicHttpResources.dart';
import 'Constants/Http/httpBehaviourConstants.dart';
import 'Constants/Luna2/luna2ChainKeys.dart';
import 'Constants/Luna2/luna2ResourceUrls.dart';
import 'Modules/terraHttpDIModule.dart';

class TerraStartup {
  static final injector = Injector.appInstance;

  /// intialises the kernel that manages terra-dart
  static void initializeKernel(TerraEnvironment environment,
      {int httpClientTimeoutSeconds = 120}) {
    configureTerraEnvironment(environment);
    HttpBehaviourConstants.DefaultHttpTimeoutSeconds = httpClientTimeoutSeconds;

    loadAllModules(); // Load all modules for dependency injection
  }

  static void loadAllModules() {
    TerraMainDIModule.load();
    TerraHttpDIModule.load();
  }

  static LcdClient getLCDClient() {
    return injector.get<LcdClient>();
  }

  static LocalTerra getLocalTerraClient() {
    return injector.get<LocalTerra>();
  }

  // static TerraRestfulService GetHttpHandler() {
  //   return Kernel.Get<TerraRestfulService>();
  // }

  static void configureTerraEnvironment(TerraEnvironment environment) {
    TerraClientConfiguration.lcdConfig = LCDClientConfig();
    TerraClientConfiguration.lcdConfig!.gasAdjustment =
        LCDDefaultConfigs.GAS_ADJUSTMENT;

    switch (TerraClientConfiguration.terra = environment) {
      case TerraEnvironment.luna2MainNet:
        TerraClientConfiguration.blockchainResourcePath =
            Luna2ResourceUrls.LUNA2_PROD_ROUTE;
        TerraClientConfiguration.lcdConfig!.chainID =
            Luna2ChainKeys.TERRA_MAINNET_CHAINID;
        break;
      case TerraEnvironment.classic:
        TerraClientConfiguration.blockchainResourcePath =
            ClassicHttpResources.CLASSIC_COLUMBUS_MAINNET;
        TerraClientConfiguration.lcdConfig!.chainID =
            ClassicChainKeys.CLASSIC_MAINNET;
        break;
      case TerraEnvironment.classicTestNet:
        TerraClientConfiguration.blockchainResourcePath =
            ClassicHttpResources.TERRA_REBELS_TESTNET;
        TerraClientConfiguration.lcdConfig!.chainID = ClassicChainKeys.TEST_NET;
        break;
      case TerraEnvironment.luna2TestNet:
        TerraClientConfiguration.blockchainResourcePath =
            Luna2ResourceUrls.LUNA2_TESTNET;
        TerraClientConfiguration.lcdConfig!.chainID =
            Luna2ChainKeys.TERRA_PISCO_TESTNET_CHAINID;
        break;
      case TerraEnvironment.localTerra:
        TerraClientConfiguration.blockchainResourcePath =
            Luna2ResourceUrls.TERRA_LOCALTERRA_ROUTE;
        TerraClientConfiguration.lcdConfig!.chainID =
            Luna2ChainKeys.TERRA_LOCAL_CHAINID;
        break;
    }
  }
}
