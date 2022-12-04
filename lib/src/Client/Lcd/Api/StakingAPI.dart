import '../../../../rest/Json/PaginationOptions.dart';
import '../../../../rest/Json/Staking/RedelegationResponseJSON.dart';
import '../../../../rest/services/terraRestfulService.dart';
import '../../../Core/Staking/Delegation.dart';
import '../../../Core/Staking/UnbondingDelegation.dart';
import 'baseAPI.dart';

class StakingAPI extends BaseAPI {
  StakingAPI(TerraRestfulService apiRequester) : super(apiRequester);

   Future<List<Delegation>> getDelegations({String delegator = "", String validator = "", PaginationOptions? options = null}) async
        {
            if (delegator.isNotEmpty && validator.isNotEmpty)
            {
                return (await this.apiRequester.GetDelegationsForAllValuesReady(delegator, validator, options)).ToList().ConvertAll(w => Delegation.FromJSON(w)).ToArray();
            }
            else if (!String.IsNullOrWhiteSpace(delegator) && String.IsNullOrWhiteSpace(validator))
            {
                return (await this.apiRequester.GetDelegationsForDelegatorsOnly(delegator, options)).ToList().ConvertAll(w => Delegation.FromJSON(w)).ToArray();
            }
            else if (String.IsNullOrWhiteSpace(delegator) && !String.IsNullOrWhiteSpace(validator))
            {
                return (await this.apiRequester.GetDelegationsForValidatorsOnly(validator, options)).ToList().ConvertAll(w => Delegation.FromJSON(w)).ToArray();
            }

            throw new ArgumentNullException($"arguments delegator and validator cannot both be empty");
        }

        Future<List<UnbondingDelegation>> getUnbondingDelegation(
            String delegator,
            String validator) async
        {
            if (delegator.isNotEmpty && validator.isNotEmpty)
            {
                var response = await this.apiRequester.GetUnbondingDelegationsForAllValuesReady(delegator, validator);
                return new UnbondingDelegation[] { response };
            }
            else if (delegator.isNotEmpty && validator.isEmpty)
            {
                return await this.apiRequester.GetUnbondingDelegationsForDelegatorsOnly(delegator);
            }
            else if (delegator.isEmpty && validator.isNotEmpty)
            {
                return await this.apiRequester.GetUnbondingDelegationsForValidatorsOnly(delegator);
            }

            throw new ArgumentNullException($"arguments delegator and validator cannot both be empty");
        }

        Future<UnbondingDelegation> getUnbondingDelegations(
            String delegator,
            String validator,
            {PaginationOptions? options})
        {
            return await this.apiRequester.GetUnbondingDelegationsForAllValuesReady(delegator, validator, options);
        }

        Future<List<RedelegationResponseJSON>> GetRedelegations(
            String delegator,
            String? validatorSrc,
            String? validatorDst,
            PaginationOptions options = null)
        {
            String rootPath = String.Concat(
                   TerraClientConfiguration.BlockchainResourcePath,
                   CosmosBaseConstants.COSMOS_STAKING_DELEGATORS_BASE,
                   $"/{delegator}/{CosmosStakingConstants.REDELEGATIONS}?src_validator_addr={validatorSrc}&dst_validator_addr={validatorDst}");
            if (options != null)
            {
                rootPath += PaginationOptionExtensions.GetPaginationRules(options);
            }

            var response = await apiRequester.GetAsync<StakingCommonJson>(rootPath);
            if (response.Successful)
            {
                return response.Result.redelegation_responses;
            }

            throw new ArgumentNullException($"");
        }

        Future<Validator[]> GetBondedValidators(String delegator, PaginationOptions options = null)
        {
            String rootPath = String.Concat(
                   TerraClientConfiguration.BlockchainResourcePath,
                   CosmosBaseConstants.COSMOS_STAKING_DELEGATORS_BASE,
                   $"/{delegator}/{CosmosStakingConstants.VALIDATORS}");
            if (options != null)
            {
                rootPath += PaginationOptionExtensions.GetPaginationRules(options);
            }

            var response = await apiRequester.GetAsync<StakingCommonJson>(rootPath);
            if (response.Successful)
            {
                return response.Result.validators.ToList().ConvertAll(w => Validator.FromJSON(w)).ToArray();
            }

            throw new ArgumentNullException($"");
        }

        Future<Validator[]> GetValidators(PaginationOptions options = null)
        {
            String rootPath = String.Concat(
                     TerraClientConfiguration.BlockchainResourcePath,
                     CosmosBaseConstants.COSMOS_STAKING_VALIDATORS_BASE);
            if (options != null)
            {
                rootPath += PaginationOptionExtensions.GetPaginationRules(options);
            }

            var response = await apiRequester.GetAsync<StakingCommonJson>(rootPath);
            if (response.Successful)
            {
                return response.Result.validators.ToList().ConvertAll(w => Validator.FromJSON(w)).ToArray();
            }

            throw new ArgumentNullException($"");
        }

        Future<Validator> GetValidator(String validator)
        {
            String rootPath = String.Concat(
                     TerraClientConfiguration.BlockchainResourcePath,
                     CosmosBaseConstants.COSMOS_STAKING_VALIDATORS_BASE, $"/{validator}");

            var response = await apiRequester.GetAsync<ValidatorDataArgsJSONContainer>(rootPath);
            if (response.Successful)
            {
                return Validator.FromJSON(response.Result.validator);
            }

            throw new ArgumentNullException($"");
        }

        Future<StakingPoolJSON> GetStakingPool()
        {
            String rootPath = String.Concat(
                     TerraClientConfiguration.BlockchainResourcePath,
                     CosmosBaseConstants.COSMOS_STAKING_POOL);

            var response = await apiRequester.GetAsync<StakingCommonJson>(rootPath);
            if (response.Successful)
            {
                return response.Result.pool;
            }

            throw new ArgumentNullException($"");
        }

        Future<StakingApiParams> GetStakingParameters()
        {
            String rootPath = String.Concat(
                     TerraClientConfiguration.BlockchainResourcePath,
                     CosmosBaseConstants.COSMOS_STAKING_PARAMS);

            var response = await apiRequester.GetAsync<StakingCommonJson>(rootPath);
            if (response.Successful)
            {
                return response.Result.@params;
            }

            throw new ArgumentNullException($"");
        }
}
