import 'package:terra_dart/src/Configuration/Environment/TerraEnvironment.dart';
import '../../Client/Lcd/Models/LCDClientConfig.dart';

class TerraClientConfiguration {
  static bool? isClassicChain;
  static String? blockchainResourcePath;
  static TerraEnvironment? terra;
  static LCDClientConfig? lcdConfig;
}
