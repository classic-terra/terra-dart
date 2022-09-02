import 'dart:core';


String getCodeId(
  txResult: BlockTxBroadcastResult | TxInfo,
  msgIndex = 0
) {
  if (
    isTxError(txResult) ||
    txResult.logs == null  ||
    txResult.logs.length == 0
  ) {
    throw new Error('could not parse code id -- tx logs are empty.');
  }
  const codeId =
    txResult.logs[msgIndex].eventsByType['store_code']['code_id'][0];
  return codeId;
}

String getContractAddress(
  txResult: BlockTxBroadcastResult | TxInfo,
  msgIndex = 0
) {
  if (
    isTxError(txResult) ||
    txResult.logs == null ||
    txResult.logs.length === 0
  ) {
    throw new Error('could not parse contract address -- tx logs are empty.');
  }
  const contractAddress =
    txResult.logs[msgIndex].eventsByType['instantiate_contract'][
      'contract_address'
    ][0];
  return contractAddress;
}

abstract class ContractEvent {
  late String contract_address;
  late String [key: string];
}

ContractEvent[] getContractEvents(
  txResult: BlockTxBroadcastResult | TxInfo,
  msgIndex = 0
) {
  if (
    isTxError(txResult) ||
    txResult.logs === undefined ||
    txResult.logs.length === 0
  ) {
    throw new Error('could not parse contract events -- tx logs are empty.');
  }
  const contractEvents: ContractEvent[] = [];
  for (const event of txResult.logs[msgIndex].events) {
    if (event.type === 'from_contract') {
      let eventData: ContractEvent = { contract_address: '' }; // will be overwritten
      let currentContractAddress = event.attributes[0].value;
      for (const att of event.attributes) {
        if (
          att.key == 'contract_address' &&
          currentContractAddress !== att.value
        ) {
          contractEvents.push(eventData);
          eventData = { contract_address: '' };
          currentContractAddress = att.value;
        }
        eventData[att.key] = att.value;
      }
      contractEvents.push(eventData);
      return contractEvents;
    }
  }
  throw new Exception("could not find event type 'from_contract' in logs");
}