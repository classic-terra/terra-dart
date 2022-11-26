import '../../Client/Lcd/Api/Args/Auth/KeysDto.dart';

abstract class SharedAccounts {
  double getAccountNumber();
  double getSequenceNumber();
  KeysDto getPublicKey();
}
