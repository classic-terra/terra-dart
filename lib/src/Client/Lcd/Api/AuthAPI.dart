import 'package:terra_dart/src/Client/Lcd/Api/baseAPI.dart';

import '../../../../rest/Json/Auth/AccountDto.dart';
import '../../../../rest/Json/Auth/AccountDtoContainer.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../Constants/cosmosBaseConstants.dart';

class AuthAPI extends BaseAPI {
  AuthAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<AccountDto> getAccountInfoWalletAddress(String walletAddress) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_AUTH_ACCOUNTS}/$walletAddress";

    var response = await apiRequester.getAsync<AccountDtoContainer>(root);
    if (response.successful!) {
      return AccountDto.fromJson(response.result!);
    }

    throw Exception(
        "Could not successfully fetch the account information for wallet address: $walletAddress");
  }
}
