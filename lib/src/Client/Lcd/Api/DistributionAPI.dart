import 'package:terra_dart/rest/Json/Distribution/RewardsDto.dart';
import 'package:terra_dart/src/Client/Lcd/Api/Args/Distribution/Rewards.dart';
import 'package:terra_dart/src/Core/coin.dart';

import '../../../../rest/Json/Distribution/CommissionInfoApiJson.dart';
import '../../../../rest/Json/Distribution/DistributionInfoApiJson.dart';
import '../../../../rest/Json/Distribution/DistributionParamsInfoJson.dart';
import '../../../../rest/Json/Distribution/DistributionRewardsInfoJson.dart';
import '../../../../rest/Json/Distribution/DistributionWithDrawInfoJson.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../Constants/cosmosDistributionResources.dart';
import 'baseAPI.dart';

import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../Core/Extensions/CoinExtensions.dart';
import '../Constants/cosmosBaseConstants.dart';

class DistributionAPI extends BaseAPI {
  DistributionAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<List<Rewards>> getRewards(String delegator) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_DISTRIBUTION_DELEGATORS}/$delegator/${CosmosDistributionResources.REWARDS}";

    var response =
        await apiRequester.getAsync<DistributionRewardsInfoJson>(root);
    if (response.successful!) {
      var rewards = DistributionRewardsInfoJson.fromJson(response.result!);

      return rewards.rewards!
          .map((e) =>
              Rewards(e.validator_address, CoinsExtensions.fromJSON(e.reward!)))
          .toList();
    }

    throw Exception("");
  }

  Future<List<Coin>> getValidatorCommission(String validator) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_DISTRIBUTION_VALIDATORS}/$validator/${CosmosDistributionResources.COMMISSION}";

    var response = await apiRequester.getAsync<CommissionInfoApiJson>(root);
    if (response.successful!) {
      var rewards = CommissionInfoApiJson.fromJson(response.result!);

      return CoinsExtensions.fromJSON(rewards.commission!.commission!);
    }

    throw Exception("");
  }

  Future<String> getWithdrawAddress(String delegator) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_DISTRIBUTION_DELEGATORS}/$delegator/${CosmosDistributionResources.WITHDRAW_ADDRESS}";

    var response =
        await apiRequester.getAsync<DistributionWithDrawInfoJson>(root);
    if (response.successful!) {
      return DistributionWithDrawInfoJson.fromJson(response.result!)
          .withdraw_address;
    }

    throw Exception("");
  }

  Future<List<Coin>> getCommunityPool() async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_DISTRIBUTION_COMMUNITY_POOL}";

    var response = await apiRequester.getAsync<DistributionInfoApiJson>(root);
    if (response.successful!) {
      var rewards = DistributionInfoApiJson.fromJson(response.result!);

      return CoinsExtensions.fromJSON(rewards.pool!);
    }

    throw Exception("");
  }

  Future<DistributionParamsInfoJson> getParams() async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_DISTRIBUTION_PARAMS}";

    var response = await apiRequester.getAsync<DistributionInfoApiJson>(root);
    if (response.successful!) {
      return DistributionInfoApiJson.fromJson(response.result!).params!;
    }

    throw Exception("");
  }
}
