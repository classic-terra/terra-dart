import '../oracle/oracle/msgs/market'{ MsgSwap } from './MsgSwap';
export '../oracle/oracle/msgs/market'* from './MsgSwap';

import '../oracle/oracle/msgs/market'{ MsgSwapSend } from './MsgSwapSend';
export '../oracle/oracle/msgs/market'* from './MsgSwapSend';

export '../oracle/oracle/msgs/market'type MarketMsg = MsgSwap | MsgSwapSend;

export '../oracle/oracle/msgs/market'

namespace MarketMsg {
  export type Amino = MsgSwap.Amino | MsgSwapSend.Amino;
  export type Data = MsgSwap.Data | MsgSwapSend.Data;
  export type Proto = MsgSwap.Proto | MsgSwapSend.Proto;
}