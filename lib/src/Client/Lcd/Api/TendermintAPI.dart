import '../../../../rest/Json/Tendermint/Blocks/BlockContainer.dart';
import '../../../../rest/Json/Tendermint/Core/NodeInfoCommonJSON.dart';
import '../../../../rest/Json/Tendermint/Core/SyncingJson.dart';
import '../../../../rest/Json/Tendermint/Core/TendermintAPICommonJSON.dart';
import '../../../../rest/Json/Tendermint/Core/TendermintValidators.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../Constants/cosmosBaseConstants.dart';
import 'baseAPI.dart';

class TendermintAPI extends BaseAPI {
  TendermintAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<NodeInfoCommonJSON> getNodeInfo() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_TENDERMINT_NODE_INFO}";

    var response = await apiRequester.getAsync<NodeInfoCommonJSON>(rootPath);
    if (response.successful!) {
      var result = NodeInfoCommonJSON.fromJson(response.result!);
      return result;
    }

    throw Exception("");
  }

  Future<bool> getSyncing() async {
    var rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_TENDERMINT_SYNCING}";

    var response = await apiRequester.getAsync<SyncingJson>(rootPath);
    if (response.successful!) {
      var result = SyncingJson.fromJson(response.result!);
      return result.syncing;
    }

    throw Exception("");
  }

  Future<List<TendermintValidators>> getValidatorSet({double? height}) async {
    String ht = height != null
        ? "${CosmosBaseConstants.COSMOS_TENDERMINT_VALIDATOR_SETS_BASE}/$height"
        : CosmosBaseConstants.COSMOS_TENDERMINT_VALIDATOR_SETS_LATEST;

    var rootPath = "${TerraClientConfiguration.blockchainResourcePath}$ht";

    var response =
        await apiRequester.getAsync<TendermintAPICommonJSON>(rootPath);
    if (response.successful!) {
      var result = TendermintAPICommonJSON.fromJson(response.result!);
      return result.validators;
    }

    throw Exception("");
  }

  Future<BlockContainer> getBlockInfo({double? height}) async {
    String ht = height != null
        ? "${CosmosBaseConstants.COSMOS_TENDERMINT_BLOCKS}/$height"
        : CosmosBaseConstants.COSMOS_TENDERMINT_BLOCKS_LATEST;

    var rootPath = "${TerraClientConfiguration.blockchainResourcePath}$ht";

    var response = await apiRequester.getAsync<BlockContainer>(rootPath);
    if (response.successful!) {
      return BlockContainer.fromJson(response.result!);
    }

    throw Exception("");
  }
}
