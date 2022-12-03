import 'package:terra_dart/rest/services/terraHttpClientHandler.dart';
import 'package:terra_dart/rest/services/terraRestfulService.dart';

import '../Client/Lcd/Api/AuthAPI.dart';
import '../TerraStartup.dart';

class TerraHttpDIModule {
  static void load() {
    _registerHttpServices();
  }

  static void _registerHttpServices() {
    TerraStartup.injector.registerSingleton<TerraHttpClientHandler>(
        () => TerraHttpClientHandler());
    TerraStartup.injector.registerSingleton<TerraRestfulService>(() =>
        TerraRestfulService(
            TerraStartup.injector.get<TerraHttpClientHandler>()));
  }
}
