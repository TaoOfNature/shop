import 'dart:convert';

import 'package:crypto/crypto.dart';

class Utils {
  static String generateMd5(String text1, String text2) {
    String saltedPassword = text1 + text2;
    String finalHash = md5.convert(utf8.encode(saltedPassword)).toString();
    return finalHash.toLowerCase();
  }
}
