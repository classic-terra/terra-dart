import 'dart:convert';
import 'dart:typed_data';
import 'package:hash/hash.dart';

String hashToHex(String data) {
  return SHA256().update(base64.encode(data)).digest().toString().toUpperCase();
}

/**
 * Calculates the transaction hash from Amino-encoded string.
 * @param data raw bytes
 */
Uint8List sha256(Uint8List data) {
  return SHA256().update(new Word32Array(data)).digest();
}

Uint8List ripemd160(Uint8List data) {
  return RIPEMD160().update(new Word32Array(data)).digest();
}
