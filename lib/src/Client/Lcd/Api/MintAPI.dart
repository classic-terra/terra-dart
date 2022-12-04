import '../../../../rest/Json/Mint/MintApiAnnualProvisionsArgs.dart';
import '../../../../rest/Json/Mint/MintApiInflationArgs.dart';
import '../../../../rest/Json/Mint/MintParamsApi.dart';
import '../../../../rest/Json/Mint/MintParamsApiValueApi.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../Constants/cosmosBaseConstants.dart';
import 'baseAPI.dart';

class MintAPI extends BaseAPI {
  MintAPI(TerraRestfulService apiRequester) : super(apiRequester);
  Future<double> getInflation() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_MINT_INFLATION}";

    var response = await apiRequester.getAsync<MintApiInflationArgs>(rootPath);
    if (response.successful!) {
      var result = MintApiInflationArgs.fromJson(response.result!);
      return double.parse(result.inflation);
    }

    throw Exception("");
  }

  Future<double> getAnnualProvisions() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_MINT_ANNUAL_PROVISIONS}";

    var response =
        await apiRequester.getAsync<MintApiAnnualProvisionsArgs>(rootPath);
    if (response.successful!) {
      var result = MintApiAnnualProvisionsArgs.fromJson(response.result!);
      return double.parse(result.annual_provisions);
    }

    throw Exception("");
  }

  Future<MintParamsApiValueApi> getMintParameters() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_MINT_PARAMS}";

    var response = await apiRequester.getAsync<MintParamsApi>(rootPath);
    if (response.successful!) {
      var result = MintParamsApi.fromJson(response.result!);
      return result.params;
    }

    throw Exception("");
  }
}
