import '../../../rest/Json/Gov/Proposals/ProposalContent.dart';
import '../../../rest/Json/Gov/Proposals/ProposalsFinallyTallyResults.dart';
import '../../../rest/Json/enums/ProposalStatus.dart';
import '../coin.dart';

class FinalTallyResult {
  double? yes;
  double? abstain;
  double? no;
  double? no_with_veto;

  static FinalTallyResult fromJSON(ProposalsFinallyTallyResults data) {
    return FinalTallyResult()
      ..yes = double.parse(data.yes)
      ..abstain = double.parse(data.abstain)
      ..no = double.parse(data.no)
      ..no_with_veto = double.parse(data.no_with_veto);
  }
}

class CommonProposalArgs {
  ProposalContent? content;
  double? id;
  ProposalStatus? status;
  FinalTallyResult? final_tally_result;
  String? submit_time;
  String? deposit_end_time;
  List<Coin>? total_deposit;
  String? Voting_Start_Time;
  String? Voting_End_Time;
}
