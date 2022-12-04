    import 'package:terra_dart/src/Core/fee.dart';

import '../../rest/Json/Tx/Transaction/TxAuthInfo.dart';

class AuthInfo
    {
        final List<SignerInfo>? signer_infos;
         final Fee fee;

         AuthInfo(
            this.signer_infos,
            this.fee);

         static AuthInfo fromJSON(TxAuthInfo data)
        {
            return  AuthInfo(
                data.signer_infos.ToList().ConvertAll(w =>
                new SignerInfo(
                    w._key,
                    w.sequence,
                    ModeInfo.FromJSON(w.mode_info))),
                    Fee.FromJSON(data.fee));
        }
         static AuthInfo fromData(AuthInfoDataArgs data)
        {
            if (data.Signer_Infos != null)
            {
                return new AuthInfo(data.Signer_Infos.ToList().ConvertAll(w => SignerInfo.FromData(w)).ToList(), Fee.FromData(data.Fee));
            }

            return new AuthInfo(null, Fee.FromData(data.Fee));
        }

         byte[] ToProto()
        {
            return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
        }

         PROTO.AuthInfo ToProtoWithType()
        {
            return new PROTO.AuthInfo()
            {
                Fee = this.fee.ToProtoWithType(),
                SignerInfos = this.signer_infos.ConvertAll(w => w.ToProtoWithType()),
            };
        }

         AuthInfoDataArgs ToData()
        {
            return new AuthInfoDataArgs()
            {
                Signer_Infos = this.signer_infos.ToList().ConvertAll(w => w.ToData()).ToArray(),
                Fee = this.fee.ToData()
            };
        }

         TxAuthInfo ToJson()
        {
            return new TxAuthInfo()
            {
                fee = this.fee.ToJson(),
                signer_infos = this.signer_infos.ConvertAll(w => w.ToJson()).ToArray()
            };
        }

         static AuthInfo FromBytes(byte[] data)
        {
            return ProtoExtensions.DeserialiseFromBytes<AuthInfo>(data);
        }
    }

     class AuthInfoDataArgs
    {
         List<SignerInfoDataArgs> Signer_Infos ;
         FeeDataArgs fee ;
    }