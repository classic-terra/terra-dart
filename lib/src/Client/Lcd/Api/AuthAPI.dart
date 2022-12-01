import 'package:terra_dart/src/Client/Lcd/Api/baseAPI.dart';

import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../rest/services/terraRestfulService.dart';
import '../Constants/cosmosBaseConstants.dart';

class AuthAPI extends BaseAPI {

      AuthAPI(TerraRestfulService apiRequester)  :super(apiRequester);

          Future<AccountDto> GetAccountInfoWalletAddress(String walletAddress)async
        {
            String root = "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_AUTH_ACCOUNTS}$walletAddress";

            var response = await this.apiRequester.GetAsync<AccountDtoContainer>(root);
            if (response.Successful)
            {
                return response.Result.Account;
            }

            throw new ArgumentNullException($"Could not successfully fetch the account information for wallet address: {walletAddress}");
        }
}
