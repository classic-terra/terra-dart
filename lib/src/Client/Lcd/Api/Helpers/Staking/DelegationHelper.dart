import '../../../../../../rest/Json/PaginationOptions.dart';
import '../../../../../../rest/Json/Staking/StakingCommonJson.dart';
import '../../../../../../rest/Json/Staking/StakingDelegationResponse.dart';
import '../../../../../../rest/services/terraRestfulService.dart';
import '../../../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../Constants/cosmosBaseConstants.dart';
import '../../../Constants/cosmosStakingConstants.dart';

class DelegationHelper {
  static Future<List<StakingDelegationResponse>>
      getDelegationsForAllValuesReady(
          TerraRestfulService apiRequester, String delegator, String validator,
          {PaginationOptions? options}) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_STAKING_VALIDATORS_BASE}/$validator/${CosmosStakingConstants.DELEGATIONS}/$delegator";

    // if (options != null)
    // {
    //     rootPath += PaginationOptionExtensions.GetPaginationRules(options);
    // }

    var response = await apiRequester.getAsync<StakingCommonJson>(rootPath);
    if (response.successful!) {
      return StakingCommonJson.fromJson(response.result!).delegation_responses;
    }

    throw Exception("");
  }

  static Future<List<StakingDelegationResponse>>
      getDelegationsForDelegatorsOnly(
          TerraRestfulService apiRequester, String delegator,
          {PaginationOptions? options}) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_STAKING_DELEGATIONS_BASE}/$delegator";

    // if (options != null)
    // {
    //     rootPath += PaginationOptionExtensions.GetPaginationRules(options);
    // }

    var response = await apiRequester.getAsync<StakingCommonJson>(rootPath);
    if (response.successful!) {
      return StakingCommonJson.fromJson(response.result!).delegation_responses;
    }

    throw Exception("");
  }

  static Future<List<StakingDelegationResponse>>
      getDelegationsForValidatorsOnly(
          TerraRestfulService apiRequester, String validator,
          {PaginationOptions? options}) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_STAKING_VALIDATORS_BASE}/$validator/${CosmosStakingConstants.DELEGATIONS}";

    // if (options != null)
    // {
    //     rootPath += PaginationOptionExtensions.GetPaginationRules(options);
    // }

    var response = await apiRequester.getAsync<StakingCommonJson>(rootPath);
    if (response.successful!) {
      return StakingCommonJson.fromJson(response.result!).delegation_responses;
    }

    throw Exception("");
  }
}
