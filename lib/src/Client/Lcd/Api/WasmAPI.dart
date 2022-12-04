import 'package:terra_dart/src/Client/Lcd/Api/baseAPI.dart';

import '../../../../rest/Json/Wasm/WasmCodeInfo.dart';
import '../../../../rest/Json/Wasm/WasmContainer.dart';
import '../../../../rest/Json/Wasm/WasmContractInfo.dart';
import '../../../../rest/Json/Wasm/WasmParams.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../Constants/cosmosBaseConstants.dart';

class WasmAPI extends BaseAPI {
  WasmAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<WasmCodeInfo> getCodeInfo(double codeID) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_WASM_CODES}/$codeID";

    var response = await apiRequester.getAsync<WasmContainer>(rootPath);
    if (response.successful!) {
      var result = WasmContainer.fromJson(response.result!);
      return result.code_info;
    }

    throw Exception("");
  }

  Future<WasmContractInfo> getContractInfo(String contractAddress) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_WASM_CONTRACTS}/$contractAddress";

    var response = await apiRequester.getAsync<WasmContainer>(rootPath);
    if (response.successful!) {
      var result = WasmContainer.fromJson(response.result!);
      return result.contract_info;
    }

    throw Exception("");
  }

  Future<String> getContractQuery(String contractAddress) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_WASM_CONTRACTS}/$contractAddress/store";

    var response = await apiRequester.getAsync<WasmContainer>(rootPath);
    if (response.successful!) {
      var result = WasmContainer.fromJson(response.result!);
      return result.query_result;
    }

    throw Exception("");
  }

  Future<WasmParams> getParameters() async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_WASM_PARAMS}";

    var response = await apiRequester.getAsync<WasmContainer>(rootPath);
    if (response.successful!) {
      var result = WasmContainer.fromJson(response.result!);
      return result.params;
    }

    throw Exception("");
  }
}
