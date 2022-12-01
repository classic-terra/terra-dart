  class SignerInfo
    {
        KeysDto public_key;
         double sequence;
         ModeInfo mode_info;

         SignerInfo(
            this. public_key,
            this.  sequence,
            this.  mode_info);

        static SignerInfo fromData(SignerInfoDataArgs data)
        {
            return new SignerInfo(
                data.Public_Key,
                data.Sequence,
                ModeInfo.FromData(data.Mode_Info));
        }

        // public PROTO.SignerInfo ToProtoWithType()
        // {
        //     var msg = new PROTO.SignerInfo()
        //     {
        //         ModeInfo = this.mode_info.ToProtoWithType(),
        //         Sequence = (ulong)this.sequence,
        //         PublicKey = this.public_key!.PackAny(this.public_key.Key)
        //     };

        //     return msg;
        // }

        //  byte[] ToProto()
        // {
        //     return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
        // }

         SignerInfoDataArgs ToData()
        {
            return new SignerInfoDataArgs()
            {
                Sequence = this.sequence,
                Mode_Info = this.mode_info.ToData(),
                Public_Key = this.public_key,
            };
        }

         TxSignerInfo ToJson()
        {
            return new TxSignerInfo()
            {
                mode_info = this.mode_info.ToJSON(),
                public_key = this.public_key,
                sequence = this.sequence
            };
        }
    }

     class SignerInfoDataArgs
    {
         KeysDto? Public_Key {;
         double? Sequence;
         ModeInfoDataArgs? Mode_Info ;
    }