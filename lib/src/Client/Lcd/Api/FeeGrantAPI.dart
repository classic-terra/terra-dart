import 'dart:ffi';

import 'package:terra_dart/src/Core/FeeGrant/Allowances/BasicAllowance.dart';

import '../../../../rest/Json/FeeGrant/FeeGrantAllowancesContainer.dart';
import '../../../../rest/Json/FeeGrant/FeeGrantAllowancesJson.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../Constants/cosmosBaseConstants.dart';
import 'baseAPI.dart';

class FeeGrantAPI extends BaseAPI {
  FeeGrantAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<List<FeeGrantAllowancesJson>> getAllowances(
      String walletGrantee) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_FEEGRANT_ALLOWANCES}/$walletGrantee";

    var response =
        await apiRequester.getAsync<FeeGrantAllowancesContainer>(root);
    if (response.successful!) {
      return FeeGrantAllowancesContainer.fromJson(response.result!).allowances;
    }

    throw Exception("");
  }

  // Future<PeriodicAllowance> getPeriodicAllowance(
  //     String walletGrantee, String walletGranter) async {
  //   String root =
  //       "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_FEEGRANT_ALLOWANCE}/$walletGranter/$walletGrantee";

  //   var response =
  //       await apiRequester.getAsync<FeeGrantAllowancesContainer>(root);
  //   if (response.successful!) {
  //     var allowance =
  //         FeeGrantAllowancesContainer.fromJson(response.result!).allowance;
  //   }

  //   throw Exception("");
  // }

//   Future<BasicAllowance> getBasicAllowance(
//       String walletGrantee, String walletGranter) async {
//     String root =
//         "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_FEEGRANT_ALLOWANCE}/$walletGranter/$walletGrantee";

//     var response =
//         await apiRequester.getAsync<FeeGrantAllowancesContainer>(root);
//     if (response.successful!) {
//       var allowance =
//           FeeGrantAllowancesContainer.fromJson(response.result!).allowance;

// var data = BasicAllowanceDataArgs()
// ..expiration = Allocator
//           BasicAllowance.fromData()
//     }

//     throw Exception("");
//   }
}
