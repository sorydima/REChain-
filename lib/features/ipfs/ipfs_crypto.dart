import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;

class IpfsCrypto {
  static Uint8List encryptFile(Uint8List data, String password) {
    final key = encrypt.Key.fromUtf8(password.padRight(32, '0').substring(0, 32));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encryptBytes(data, iv: iv);
    return Uint8List.fromList(encrypted.bytes);
  }

  static Uint8List decryptFile(Uint8List data, String password) {
    final key = encrypt.Key.fromUtf8(password.padRight(32, '0').substring(0, 32));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decryptBytes(
      encrypt.Encrypted(data),
      iv: iv,
    );
    return Uint8List.fromList(decrypted);
  }
} 