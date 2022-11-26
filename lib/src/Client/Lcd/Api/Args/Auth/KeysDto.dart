import 'package:terra_dart/src/Client/Lcd/Api/Args/Auth/PublicKeys.dart';

class KeysDto {
  String? typeUrl;

  int? threshold;
  String? key;
  String? TypeUrl;
  List<PublicKeys>? public_keys;

  bool isMultiSig() {
    return public_keys != null;
  }
}
