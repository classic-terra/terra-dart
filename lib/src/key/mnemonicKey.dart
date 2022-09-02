
  coinType: LUNA_COIN_TYPE,
};

/**
 * Implements a BIP39 mnemonic wallet with standard key derivation from a word list. Note
 * that this implementation exposes the private key in memory, so it is not advised to use
 * for applications requiring high security.
 */
export class MnemonicKey extends RawKey {
  /**
   * Space-separated mnemonic phrase.
   */
  public mnemonic: string;

  /**
   * Creates a new signing key from a mnemonic phrase. If no mnemonic is provided, one
   * will be automatically generated.
   *
   * ### Providing a mnemonic
   *
   * ```ts
   * import { MnemonicKey } from 'terra.js';
   *
   * const mk = new MnemonicKey({ mnemonic: '...' });
   * console.log(mk.accAddress);
   * ```
   *
   * ### Generating a random mnemonic
   *
   * ```ts
   * const mk2 = new MnemonicKey();
   * console.log(mk2.mnemonic);
   * ```
   *
   * @param options
   */
  constructor(options: MnemonicKeyOptions = {}) {
    const { account, index, coinType } = {
      ...DEFAULT_OPTIONS,
      ...options,
    };
    let { mnemonic } = options;
    if (mnemonic === undefined) {
      mnemonic = bip39.generateMnemonic(256);
    }
    const seed: Buffer = bip39.mnemonicToSeedSync(mnemonic);
    const masterKey = bip32.fromSeed(seed);
    const hdPathLuna = `m/44'/${coinType}'/${account}'/0/${index}`;
    const terraHD = masterKey.derivePath(hdPathLuna);
    const privateKey = terraHD.privateKey;

    if (!privateKey) {
      throw new Error('Failed to derive key pair');
    }

    super(privateKey);
    this.mnemonic = mnemonic;
  }
}