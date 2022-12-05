import 'package:terra_dart/src/Core/Extensions/HashExtensionsLegacy.dart';

import '../../../../rest/Json/Tx/Transaction/TxContainerJSON.dart';
import '../../../../rest/Json/Tx/Transaction/TxResponse.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../TerraStartup.dart';
import '../Constants/cosmosBaseConstants.dart';
import 'baseAPI.dart';

class TxAPI extends BaseAPI {
  TxAPI(TerraRestfulService apiRequester) : super(apiRequester);
  Future<TxResponse> getTxInfo(String txHash) async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_TX_TXS}/$txHash";

    print("HASH $rootPath");
    var response = await apiRequester.getAsync<TxContainerJSON>(rootPath);
    if (response.successful!) {
      var result = TxContainerJSON.fromJson(response.result!);
      return result.tx_response;
    }

    throw Exception("");
  }

  Future<List<String>> getTxHashesByBlockHeight(int? height) async {
    var blockInfo = await TerraStartup.getLCDClient()
        .tendermint
        .getBlockInfo(height: height);
    var txs = blockInfo.block.data;

    return txs.txs.map((w) => HashExtensions.hashToHex(w)).toList();
  }
}
