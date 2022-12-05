import 'package:string_extensions/string_extensions.dart';

import '../../../../rest/Json/Authz/AuthorizationGrantsJSON.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Configuration/Environment/TerraClientConfiguration.dart';
import '../../../Core/Authz/Authorizations/AuthorizationGrant.dart';
import '../Constants/cosmosBaseConstants.dart';
import 'baseAPI.dart';

class AuthzAPI extends BaseAPI {
  AuthzAPI(TerraRestfulService apiRequester) : super(apiRequester);

  Future<List<AuthorizationGrant>> getAuthorizationGrants(
      String walletGranter, String walletGrantee,
      {String msgTypeUrl = ""}) async {
    String rootPath =
        "${TerraClientConfiguration.blockchainResourcePath}${CosmosBaseConstants.COSMOS_AUTHZ_GRANTS}";

    String getPath = "$rootPath?granter=$walletGranter&grantee=$walletGrantee";
    if (msgTypeUrl.isNotBlank && msgTypeUrl.isNotEmpty) {
      getPath += "&msg_type_url=$msgTypeUrl";
    }

    var response =
        await apiRequester.getAsync<AuthorizationGrantsJSON>(getPath);
    if (response.successful!) {
      var cgrants = AuthorizationGrantsJSON.fromJson(response.result!).grants;
      return cgrants
          .map((grant) =>
              AuthorizationGrant(grant.authorization, grant.expiration))
          .toList();
    }

    throw Exception(
        "Could not successfully fetch the authorization information for wallet granter: $walletGranter");
  }
}
