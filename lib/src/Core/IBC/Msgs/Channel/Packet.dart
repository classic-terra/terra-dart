   import '../Client/Height.dart';

class Packet
    {
        final  double sequence;
      final    String source_port;
       final   String source_channel;
       final   String destination_port;
      final    String destination_channel;
       final   String data;
       final   Height timeout_height;
      final    double timeout_timestamp;

         Packet(
            this. sequence,
            this. source_port,
            this. source_channel,
            this. destination_port,
            this. destination_channel,
            this. data,
            this. timeout_height,
            this. timeout_timestamp);

         static Packet fromData(PacketDataArgs data)
        {
            return new Packet(
                data.Sequence,
                data.Source_Port,
                data.Source_Channel,
                data.Destination_Port,
                data.Destination_Channel,
                data.Data,
                Height.FromData(data.Timeout_Height),
                double.Parse(data.Timeout_TimeStamp));
        }

        //  static Packet FromProto(PROTO.Packet data)
        // {
        //     return new Packet(
        //          data.Sequence,
        //          data.SourcePort,
        //          data.SourceChannel,
        //          data.DestinationPort,
        //          data.DestinationChannel,
        //          TerraStringExtensions.GetBase64FromBytes(data.Data),
        //          Height.FromProto(data.TimeoutHeight),
        //          data.TimeoutTimestamp);
        // }

         PacketDataArgs toData()
        {
            return  PacketDataArgs()
            {
                Data = this.data,
                Destination_Channel = this.destination_channel,
                Destination_Port = this.destination_port,
                Source_Port = this.source_port,
                Sequence = this.sequence,
                Source_Channel = this.source_channel,
                Timeout_Height = this.timeout_height.ToData(),
                Timeout_TimeStamp = this.timeout_timestamp.ToString(),
            };
        }


        //  PROTO.Packet ToProtoWithType()
        // {
        //     return new PROTO.Packet()
        //     {
        //         Data = TerraStringExtensions.GetBase64BytesFromString(this.data),
        //         DestinationChannel = this.destination_channel,
        //         DestinationPort = this.destination_port,
        //         Sequence = (ulong)this.sequence,
        //         SourceChannel = this.source_channel,
        //         SourcePort = this.source_port,
        //         TimeoutHeight = this.timeout_height.ToProtoWithType(),
        //         TimeoutTimestamp = (ulong)this.timeout_timestamp
        //     };
        // }

        //  byte[] ToProto()
        // {
        //     return ProtoExtensions.SerialiseFromData(this.ToProtoWithType());
        // }
    }
     class PacketAminoArgs extends PacketCommonArgs
    {
         HeightAminoArgs? timeout_height ;
    }
     class PacketDataArgs extends PacketCommonArgs
    {
         HeightDataArgs? timeout_height ;
    }

     class PacketCommonArgs
    {
         double? sequence ;
         String? source_port ;
         String? source_channel ;
         String? destination_port ;
         String? destination_channel ;
         String? data ;
         String? timeout_timeStamp ;
    }