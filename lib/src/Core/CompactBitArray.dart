  import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

class CompactBitArray
    {
          int extra_bits_stored;
          List<int> elems;
         CompactBitArray(this. extra_bits_stored,this.elems);

        static CompactBitArray fromBits(int bits)
        {
            if (bits <= 0)
            {
                throw  Exception("CompactBitArray bits must be bigger than 0");
            }

            var numElems = (bits + 7) / 8;
            if (numElems <= 0 || numElems >  (pow(2, 32) - 1))
            {
                throw Exception("CompactBitArray overflow");
            }

            return  CompactBitArray(bits % 8, List<int>(numElems));
        }

         double count()
        {
            if (extra_bits_stored == 0)
            {
                return elems.length * 8;
            }

            return (elems.length - 1) * 8 + this.extra_bits_stored;
        }

         bool getIndex(int i)
        {
            if (i < 0 || i >= count())
            {
                return false;
            }

            using (var stream = new MemoryStream(this.elems))
            {
                return (stream.Read(this.elems, i >> 3, (int)this.Count()) & (1 << (7 - (i % 8)))) > 0;
            }
        }

         bool setIndex(int i, bool v)
        {
            if (i < 0 || i >= this.Count())
            {
                return false;
            }

            if (v)
            {
                elems[i >> 3] |= (byte)(1 << (7 - (i % 8)));
            }
            else
            {
                elems[i >> 3] &= (byte)~(1 << (7 - (i % 8)));
            }

            return true;
        }

         double numTrueBitsBefore(double index)
        {
            var countOneBits = new Func<byte, int>((n) =>
            {
                return n.ToString().ElementAt(2).ToString().Split("0").Length;
            });

            int ones_count = 0;
            var max = count();
            if (index > max)
            {
                index = max;
            }

            for (int elem = 0; elem < elems.length; elem++)
            {
                if ((elem * 8 + 7) >= index)
                {
                    var offset = (byte)(elems[elem] >> (7 - ((byte)index % 8) + 1));
                    return (ones_count += countOneBits(offset));
                }

                ones_count += countOneBits(elems[elem]);
            }

            return ones_count;
        }

        //  static CompactBitArray FromProto(COMB.CompactBitArray proto)
        // {
        //     return new CompactBitArray(proto.ExtraBitsStored, proto.Elems);
        // }
        //  static CompactBitArray FromProto(TerraProto.CSharp.third_party.proto.cosmos.tx.signing.v1beta1.CompactBitArray proto)
        // {
        //     return new CompactBitArray(proto.ExtraBitsStored, proto.Elems);
        // }

         static CompactBitArray fromData(CompactBitArrayData data)
        {
            return CompactBitArray(data.extraBitsStored, TerraStringExtensions.GetBytesFromString(TerraStringExtensions.GetBase64FromString(data.Elems)));
        }

         CompactBitArrayData ToData()
        {
            return new CompactBitArrayData()
            {
                Elems = TerraStringExtensions.GetBase64FromString(TerraStringExtensions.GetStringFromBytes(this.elems)),
                ExtraBitsStored = this.extra_bits_stored
            };
        }

         TxBitArray ToJSON()
        {
            return new TxBitArray()
            {
                elems = TerraStringExtensions.GetBase64FromString(TerraStringExtensions.GetStringFromBytes(this.elems)),
                extra_bits_stored = this.extra_bits_stored
            };
        }

        //  COMB.CompactBitArray ToProtoWithType()
        // {
        //     return new COMB.CompactBitArray()
        //     {
        //         Elems = this.elems,
        //         ExtraBitsStored = (uint)this.extra_bits_stored
        //     };
        // }
        //  CN.CompactBitArray ToProtoWithTypeSign()
        // {
        //     return new CN.CompactBitArray()
        //     {
        //         Elems = this.elems,
        //         ExtraBitsStored = (uint)this.extra_bits_stored
        //     };
        // }

        // public byte[] ToProto(bool withSign = false)
        // {
        //     if (withSign)
        //     {
        //         return ProtoExtensions.SerialiseFromData(this.ToProtoWithTypeSign());
        //     }

        //     return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
        // }
    }

     class CompactBitArrayData
    {
         int? extraBitsStored ;
         String? elems ;
    }