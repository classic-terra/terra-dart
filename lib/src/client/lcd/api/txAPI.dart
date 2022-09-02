
  ): Promise<Tx> {
    let { fee } = options;
    const { msgs, memo, timeoutHeight } = options;

    const signerDatas: SignerData[] = [];
    for (const signer of signers) {
      let sequenceNumber = signer.sequenceNumber;
      let publicKey = signer.publicKey;

      if (sequenceNumber === undefined || !publicKey) {
        const account = await this.lcd.auth.accountInfo(signer.address);
        if (sequenceNumber === undefined) {
          sequenceNumber = account.getSequenceNumber();
        }

        if (!publicKey) {
          publicKey = account.getPublicKey();
        }
      }

      signerDatas.push({
        sequenceNumber,
        publicKey,
      });
    }

    if (fee === undefined) {
      fee = await this.lcd.tx.estimateFee(signerDatas, options);
    }

    return new Tx(
      new TxBody(msgs, memo || '', timeoutHeight || 0),
      new AuthInfo([], fee),
      []
    );
  }

  /**
   * Looks up transactions on the blockchain for the block height. If height is undefined,
   * gets the transactions for the latest block.
   * @param height block height
   */
  public async txInfosByHeight(height: number | undefined): Promise<TxInfo[]> {
    const blockInfo = await this.lcd.tendermint.blockInfo(height);
    const { txs } = blockInfo.block.data;
    if (!txs) {
      return [];
    } else {
      const txhashes = txs.map(txdata => hashToHex(txdata));
      return Promise.all(txhashes.map(txhash => this.txInfo(txhash)));
    }
  }

  /**
   * Estimates the transaction's fee by simulating it within the node
   * @param sourceAddress address that will pay the bill
   * @param msgs standard messages
   * @param options options for fee estimation
   */
  public async estimateFee(
    signers: SignerData[],
    options: CreateTxOptions
  ): Promise<Fee> {
    const gasPrices = options.gasPrices || this.lcd.config.gasPrices;
    const gasAdjustment =
      options.gasAdjustment || this.lcd.config.gasAdjustment;
    const feeDenoms = options.feeDenoms || ['uusd'];
    let gas = options.gas;
    let gasPricesCoins: Coins | undefined;

    if (gasPrices) {
      gasPricesCoins = new Coins(gasPrices);

      if (feeDenoms) {
        const gasPricesCoinsFiltered = gasPricesCoins.filter(c =>
          feeDenoms.includes(c.denom)
        );

        if (gasPricesCoinsFiltered.toArray().length > 0) {
          gasPricesCoins = gasPricesCoinsFiltered;
        }
      }
    }

    const txBody = new TxBody(options.msgs, options.memo || '');
    const authInfo = new AuthInfo([], new Fee(0, new Coins()));
    const tx = new Tx(txBody, authInfo, []);

    // fill empty signature
    tx.appendEmptySignatures(signers);

    // simulate gas
    if (!gas || gas === 'auto' || gas === '0') {
      gas = (await this.estimateGas(tx, { gasAdjustment })).toString();
    }

    const feeAmount = gasPricesCoins
      ? gasPricesCoins.mul(gas).toIntCeilCoins()
      : '0uusd';

    return new Fee(Number.parseInt(gas), feeAmount, '', '');
  }

  public async estimateGas(
    tx: Tx,
    options?: {
      gasAdjustment?: Numeric.Input;
      signers?: SignerData[];
    }
  ): Promise<number> {
    const gasAdjustment =
      options?.gasAdjustment || this.lcd.config.gasAdjustment;

    // append empty signatures if there's no signatures in tx
    let simTx: Tx = tx;
    if (tx.signatures.length <= 0) {
      if (!(options && options.signers && options.signers.length > 0)) {
        throw Error('cannot append signature');
      }
      const authInfo = new AuthInfo([], new Fee(0, new Coins()));
      simTx = new Tx(tx.body, authInfo, []);
      simTx.appendEmptySignatures(options.signers);
    }

    const simulateRes = await this.c
      .post<SimulateResponse.Data>(`/cosmos/tx/v1beta1/simulate`, {
        tx_bytes: this.encode(simTx),
      })
      .then(d => SimulateResponse.fromData(d));

    return new Dec(gasAdjustment).mul(simulateRes.gas_info.gas_used).toNumber();
  }

  public async computeTax(): Promise<Coins> {
    throw new Error('Tax was removed from network');
  }

  /**
   * Encode a transaction to base64-encoded protobuf
   * @param tx transaction to encode
   */
  public encode(tx: Tx): string {
    return Buffer.from(tx.toBytes()).toString('base64');
  }

  /**
   * Decode a transaction from base64-encoded protobuf
   * @param tx transaction string to decode
   */
  public decode(encodedTx: string): Tx {
    return Tx.fromBuffer(Buffer.from(encodedTx, 'base64'));
  }

  /**
   * Get the transaction's hash
   * @param tx transaction to hash
   */
  public async hash(tx: Tx): Promise<string> {
    const txBytes = await this.encode(tx);
    return hashToHex(txBytes);
  }

  private async _broadcast<T>(
    tx: Tx,
    mode: keyof typeof BroadcastMode
  ): Promise<T> {
    return await this.c.post<any>(`/cosmos/tx/v1beta1/txs`, {
      tx_bytes: this.encode(tx),
      mode,
    });
  }

  /**
   * Broadcast the transaction using the "block" mode, waiting for its inclusion in the blockchain.
   * @param tx transaction to broadcast
   */
  public async broadcast(tx: Tx): Promise<BlockTxBroadcastResult> {
    return this._broadcast<{ tx_response: BlockTxBroadcastResult.Data }>(
      tx,
      'BROADCAST_MODE_BLOCK'
    ).then(({ tx_response: d }) => {
      const blockResult: BlockTxBroadcastResult = {
        txhash: d.txhash,
        raw_log: d.raw_log,
        gas_wanted: Number.parseInt(d.gas_wanted),
        gas_used: Number.parseInt(d.gas_used),
        height: +d.height,
        logs: d.logs.map(l => TxLog.fromData(l)),
        code: d.code,
        codespace: d.codespace,
        data: d.data,
        info: d.info,
        timestamp: d.timestamp,
      };

      return blockResult;
    });
  }

  /**
   * NOTE: This is not a synchronous function and is unconventionally named. This function
   * can be await as it returns a `Promise`.
   *
   * Broadcast the transaction using the "sync" mode, returning after CheckTx() is performed.
   * @param tx transaction to broadcast
   */
  public async broadcastSync(tx: Tx): Promise<SyncTxBroadcastResult> {
    return this._broadcast<{ tx_response: SyncTxBroadcastResult.Data }>(
      tx,
      'BROADCAST_MODE_SYNC'
    ).then(({ tx_response: d }) => {
      const blockResult: any = {
        height: +d.height,
        txhash: d.txhash,
        raw_log: d.raw_log,
      };

      if (d.code) {
        blockResult.code = d.code;
      }

      if (d.codespace) {
        blockResult.codespace = d.codespace;
      }

      return blockResult;
    });
  }

  /**
   * Broadcast the transaction using the "async" mode, returns immediately (transaction might fail).
   * @param tx transaction to broadcast
   */
  public async broadcastAsync(tx: Tx): Promise<AsyncTxBroadcastResult> {
    return this._broadcast<{ tx_response: AsyncTxBroadcastResult.Data }>(
      tx,
      'BROADCAST_MODE_ASYNC'
    ).then(({ tx_response: d }) => ({
      height: +d.height,
      txhash: d.txhash,
    }));
  }

  /**
   * Search for transactions based on event attributes.
   * @param options
   */
  public async search(
    options: Partial<TxSearchOptions>
  ): Promise<TxSearchResult> {
    const params = new URLSearchParams();

    // build search params
    options.events?.forEach(v =>
      params.append(
        'events',
        v.key === 'tx.height' ? `${v.key}=${v.value}` : `${v.key}='${v.value}'`
      )
    );

    delete options['events'];

    Object.entries(options).forEach(v => {
      params.append(v[0], v[1] as string);
    });

    return this.c
      .getRaw<TxSearchResult.Data>(`cosmos/tx/v1beta1/txs`, params)
      .then(d => {
        return {
          txs: d.tx_responses.map(tx_response => TxInfo.fromData(tx_response)),
          pagination: d.pagination,
        };
      });
  }
}