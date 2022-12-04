import '../../../../rest/Json/Gov/Proposals/ProposalsParams.dart';
import '../../../../rest/Json/Gov/Proposals/ProposalsResponseContainerValueJSON.dart';
import '../../../../rest/Json/enums/ProposalStatus.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../Core/Gov/Proposal.dart';
import '../../../Core/Gov/ProposalsDepositParams.dart';
import '../../../Core/Gov/ProposalsTallyParams.dart';
import '../../../Core/Gov/ProposalsVotesParams.dart';
import '../Constants/cosmosBaseConstants.dart';
import '../Constants/cosmosGovConstants.dart';
import 'baseAPI.dart';

class GovAPI extends BaseAPI {
  GovAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<FinalTallyResult> getTally(double proposalID) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_GOV_PROPOSALS}/$proposalID/${CosmosGovConstants.TALLY}";

    var response =
        await apiRequester.getAsync<ProposalsResponseContainerValueJSON>(root);
    if (response.successful!) {
      var results =
          ProposalsResponseContainerValueJSON.fromJson(response.result!);

      return FinalTallyResult.fromJSON(results.final_tally_result);
    }

    throw Exception("");
  }

  Future<ProposalsDepositParams> getDepositParams() async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_GOV_PARAMS_DEPOSIT}";

    var response = await apiRequester.getAsync<ProposalsParams>(root);
    if (response.successful!) {
      var results = ProposalsParams.fromJson(response.result!);

      return ProposalsDepositParams.fromJSON(results.deposit_params);
    }

    throw Exception("");
  }

  Future<ProposalsVotesParams> getVotingParams() async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_GOV_PARAMS_VOTING}";

    var response = await apiRequester.getAsync<ProposalsParams>(root);
    if (response.successful!) {
      var results = ProposalsParams.fromJson(response.result!);

      return ProposalsVotesParams.fromJSON(results.voting_params);
    }

    throw Exception("");
  }

  Future<ProposalsTallyParams> getTallyParams() async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_GOV_PARAMS_TALLYING}";

    var response = await apiRequester.getAsync<ProposalsParams>(root);
    if (response.successful!) {
      var results = ProposalsParams.fromJson(response.result!);

      return ProposalsTallyParams.fromJSON(results.tally_params);
    }

    throw Exception("");
  }

  Future<Proposals> getProposals(
            {ProposalStatus status = ProposalStatus.ProposalStatusUnspecified}) async {
    String root =
        "${TerraClientConfiguration.blockchainResourcePath}/${CosmosBaseConstants.COSMOS_GOV_PROPOSALS}?proposal_status=${(int)status}";

    var response = await apiRequester.getAsync<ProposalsParams>(root);
    if (response.successful!) {
      var results = ProposalsParams.fromJson(response.result!);

      return ProposalsTallyParams.fromJSON(results.tally_params);
    }

    throw Exception("");
  }
}
