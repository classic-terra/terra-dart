import 'dart:convert';

import 'package:terra_dart/src/Client/Lcd/Api/authAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/authzAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/bankAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/distributionAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/feeGrantAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/govAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/ibcAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/ibcTransferAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/marketAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/mintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/oracleAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/slashingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/stakingAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/tXAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/tendermintAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/treasuryAPI.dart';
import 'package:terra_dart/src/Client/Lcd/Api/txBroadcastApi.dart';
import 'package:terra_dart/src/Client/Lcd/Api/wasmAPI.dart';

import '../lcdClient.dart';

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
