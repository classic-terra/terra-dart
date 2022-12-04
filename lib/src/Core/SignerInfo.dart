//    import '../../proto/terra/keys/KeysDto.dart';

// class SignerInfo
//     {
//           KeysDto _key;
//           double sequence;
//           ModeInfo mode_info;

//          SignerInfo(
//             KeysDto _key,
//             double sequence,
//             ModeInfo mode_info)
//         {
//             this._key = _key;
//             this.sequence = sequence;
//             this.mode_info = mode_info;
//         }

//          static SignerInfo FromData(SignerInfoDataArgs data)
//         {
//             return new SignerInfo(
//                 data._Key,
//                 data.Sequence,
//                 ModeInfo.FromData(data.Mode_Info));
//         }

//          PROTO.SignerInfo ToProtoWithType()
//         {
//             var msg = new PROTO.SignerInfo()
//             {
//                 ModeInfo = this.mode_info.ToProtoWithType(),
//                 Sequence = (ulong)this.sequence,
//                 Key = this._key!.PackAny(this._key.Key)
//             };

//             return msg;
//         }

//          byte[] ToProto()
//         {
//             return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
//         }

//          SignerInfoDataArgs ToData()
//         {
//             return new SignerInfoDataArgs()
//             {
//                 Sequence = this.sequence,
//                 Mode_Info = this.mode_info.ToData(),
//                 _Key = this._key,
//             };
//         }

//          TxSignerInfo ToJson()
//         {
//             return new TxSignerInfo()
//             {
//                 mode_info = this.mode_info.ToJSON(),
//                 _key = this._key,
//                 sequence = this.sequence
//             };
//         }
//     }

//      class SignerInfoDataArgs
//     {
//          KeysDto _Key { get; set; }
//          double Sequence { get; set; }
//          ModeInfoDataArgs Mode_Info { get; set; }
//     }