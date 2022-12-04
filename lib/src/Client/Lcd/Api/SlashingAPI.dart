import '../../../../rest/Json/Slashing/SlashingApiCommonApi.dart';
import '../../../../rest/Json/Slashing/SlashingApiSigningInfo.dart';
import '../../../../rest/Json/Slashing/SlashingApiSigningInfoParams.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../Constants/cosmosBaseConstants.dart';
import 'baseAPI.dart';

class SlashingAPI extends BaseAPI {
  SlashingAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<SlashingApiSigningInfo> getSigningInfo(String valConsAddress) async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_SLASHING_SIGNING_INFO}/$valConsAddress";

    var response = await apiRequester.getAsync<SlashingApiCommonApi>(rootPath);
    if (response.successful!) {
      var result = SlashingApiCommonApi.fromJson(response.result!);
      return result.val_signing_info;
    }

    throw Exception("");
  }

  Future<List<SlashingApiSigningInfo>> getSigningInfos() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_SLASHING_SIGNING_INFO}";

    var response = await apiRequester.getAsync<SlashingApiCommonApi>(rootPath);
    if (response.successful!) {
      var result = SlashingApiCommonApi.fromJson(response.result!);
      return result.info;
    }

    throw Exception("");
  }

  Future<SlashingApiSigningInfoParams> getSigningParameters() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_SLASHING_PARAMS}";

    var response = await apiRequester.getAsync<SlashingApiCommonApi>(rootPath);
    if (response.successful!) {
      var result = SlashingApiCommonApi.fromJson(response.result!);
      return result.params;
    }

    throw Exception("");
  }
}
