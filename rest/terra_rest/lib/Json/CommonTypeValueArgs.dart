import 'package:protobuf_google/protobuf_google.dart';

class CommonTypeValueArgs {
  String? type_url;
  String? value;

  Any ToProto() {
    return new Any(
      this.type_url,
    );
  }
}
