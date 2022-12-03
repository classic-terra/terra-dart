// import 'package:terra_dart/src/Client/Lcd/Api/baseAPI.dart';

// import '../../../../rest/Json/PaginationOptions.dart';
// import '../../../../rest/Json/bank/BankInfoApiJson.dart';
// import '../../../../rest/services/terraRestfulService.dart';
// import '../../../Configuration/Environment/TerraClientConfiguration.dart';
// import '../../../Core/Extensions/CoinExtensions.dart';
// import '../../../Core/coin.dart';
// import '../Constants/cosmosBaseConstants.dart';

class BankAPI {}


//   // public BankAPI(TerraRestfulService apiRequester) : base(apiRequester)
//   //       {
//   //       }

//   //       /// <summary>
//   //       /// Gets the associated balance (total number of coins) available on the wallet address
//   //       /// </summary>
//   //       /// <param name="wallet">Wallet address to query the balance for</param>
//   //       /// <param name="options">Used for filtering the results</param>
//   //       /// <returns></returns>
//   //       /// <exception cref="ArgumentNullException"></exception>
//   //       public async Task<Coin[]> GetBalance(string wallet, PaginationOptions options = null)
//   //       {
//   //           string rootPath = string.Concat(TerraClientConfiguration.BlockchainResourcePath,
//   //               CosmosBaseConstants.COSMOS_BANK_BALANCES, $"/{wallet}");
//   //           if (options != null)
//   //           {
//   //               rootPath += PaginationOptionExtensions.GetPaginationRules(options);
//   //           }

//   //           var response = await this.apiRequester.GetAsync<BankInfoApiJson>(rootPath);
//   //           if (response.Successful)
//   //           {
//   //               return CoinsExtensions.FromJSON(response.Result.balances).ToArray();
//   //           }

//   //           throw new ArgumentNullException($"Could not successfully fetch the banking information for wallet: {wallet}");
//   //       }

//   //       /// <summary>
//   //       /// Gets the total balance of coins currently stored on the blockchain
//   //       /// </summary>
//   //       /// <param name="options">Used for filtering the results</param>
//   //       /// <returns></returns>
//   //       /// <exception cref="ArgumentNullException"></exception>
//   //       public async Task<Coin[]> GetTotalSupply(PaginationOptions options = null)
//   //       {
//   //           string rootPath = string.Concat(TerraClientConfiguration.BlockchainResourcePath, CosmosBaseConstants.COSMOS_BANK_SUPPLY);
//   //           if (options != null)
//   //           {
//   //               rootPath += PaginationOptionExtensions.GetPaginationRules(options);
//   //           }

//   //           var response = await this.apiRequester.GetAsync<BankInfoApiJson>(rootPath);
//   //           if (response.Successful)
//   //           {
//   //               return CoinsExtensions.FromJSON(response.Result.supply).ToArray();
//   //           }

//   //           throw new ArgumentNullException($"Could not successfully fetch the supply information");
//   //       }
