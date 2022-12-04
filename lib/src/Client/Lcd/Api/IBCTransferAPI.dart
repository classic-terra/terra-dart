import 'package:terra_dart/src/Client/Lcd/Api/baseAPI.dart';

import '../../../../rest/Json/IBCTransfer/IBCTransferCommonJson.dart';
import '../../../../rest/Json/IBCTransfer/IBCTransferParams.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../Core/IBCTransfer/DenomTrace.dart';
import '../Constants/cosmosBaseConstants.dart';

class IBCTransferAPI extends BaseAPI {
  IBCTransferAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<DenomTrace> getDenomTrace(String hash) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_IBC_APPS_TRANSFER_DENOM_TRACES}/$hash";

    var response = await apiRequester.getAsync<IBCTransferCommonJson>(rootPath);
    if (response.successful!) {
      var result = IBCTransferCommonJson.fromJson(response.result!);
      return DenomTrace.fromJSON(result.denom_trace);
    }

    throw Exception("");
  }

  Future<List<DenomTrace>> getDenomTraces() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_IBC_APPS_TRANSFER_DENOM_TRACES}";
    // if (options != null)
    // {
    //     rootPath += PaginationOptionExtensions.GetPaginationRules(options);
    // }

    var response = await apiRequester.getAsync<IBCTransferCommonJson>(rootPath);
    if (response.successful!) {
      var result = IBCTransferCommonJson.fromJson(response.result!);
      return result.denom_traces.map((e) => DenomTrace.fromJSON(e)).toList();
    }

    throw Exception("");
  }

  Future<IBCTransferParams> getParameters() async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_IBC_APPS_TRANSFER_PARAMS}";

    var response = await apiRequester.getAsync<IBCTransferCommonJson>(rootPath);
    if (response.successful!) {
      var result = IBCTransferCommonJson.fromJson(response.result!);
      return result.params;
    }

    throw Exception("");
  }
}
