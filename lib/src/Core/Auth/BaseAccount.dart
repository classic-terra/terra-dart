import 'package:terra_dart/src/Core/Auth/SharedAccounts.dart';

import '../../Client/Lcd/Api/Args/Auth/KeysDto.dart';

class BaseAccount implements SharedAccounts {
  final String address;
  final KeysDto public_key;
  final double account_number;
  final double sequence;

  BaseAccount(
      this.address, this.public_key, this.account_number, this.sequence);

  @override
  double getAccountNumber() {
    return account_number;
  }

  @override
  KeysDto getPublicKey() {
    return public_key;
  }

  @override
  double getSequenceNumber() {
    return sequence;
  }
}

class BaseAccountAminoArgs{
  final String type = 

}
