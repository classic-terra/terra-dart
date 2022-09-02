import { JSONSerializable } from './json';
import { Dec, Numeric } from '../core/numeric';

class Convert {
   const id = (c: any): any => c;
   const toDec = (c: Numeric.Input): Dec => new Dec(c);
   const toString = (c: any): string => c.toString();
   const toFixed = (c: number): string => c.toFixed();
   const toNumber = Number.parseInt;
   const toData = (c: JSONSerializable<any, any, any>): any => c.toData();
}