import 'package:terra_dart/src/Client/Lcd/Api/BankAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/DistributionAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/FeeGrantAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/GovAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/IBCAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/IBCTransferAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/MarketAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/MintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/OracleAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/SlashingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/StakingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TXAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TendermintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TreasuryAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/TxBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/Api/WasmAPI.dart';
import 'package:terra_dart/src/Client/Lcd/lcdClient.dart';

import '../Api/AuthAPI.dart';
import '../Api/AuthzAPI.dart';

class LocalTerra extends LcdClient {
  final AuthAPI auth;
  final AuthzAPI authz;
  final BankAPI bank;
  final DistributionAPI distribution;
  final FeeGrantAPI feeGrant;
  final GovAPI gov;
  final IBCAPI ibc;
  final IBCTransferAPI ibcTransfer;
  final MarketAPI market;
  final MintAPI mint;
  final OracleAPI oracle;
  final SlashingAPI slashing;
  final StakingAPI staking;
  final TendermintAPI tendermint;
  final TreasuryAPI treasury;
  final TxAPI tx;
  final TxBroadcastAPI broadcastTx;
  final WasmAPI wasm;

  LocalTerra(
      this.auth,
      this.authz,
      this.bank,
      this.distribution,
      this.feeGrant,
      this.gov,
      this.ibc,
      this.ibcTransfer,
      this.market,
      this.mint,
      this.oracle,
      this.slashing,
      this.staking,
      this.tendermint,
      this.treasury,
      this.tx,
      this.broadcastTx,
      this.wasm)
      : super(
            auth,
            authz,
            bank,
            distribution,
            feeGrant,
            gov,
            ibc,
            ibcTransfer,
            market,
            mint,
            oracle,
            slashing,
            staking,
            tendermint,
            treasury,
            tx,
            broadcastTx,
            wasm);
}
