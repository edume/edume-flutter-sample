import 'dart:convert';
import 'package:crypto/crypto.dart';

class EduMe {
  final String sharedSecret;

  EduMe(this.sharedSecret);

  List<int> _getBytes(input) => utf8.encode(input);

  String createSeamlessLink(String identifier, String baseLink) {
    String urlWithIdentifier = _appendSearchParam(baseLink, {"e": identifier});
    return _appendSignature(urlWithIdentifier, sharedSecret);
  }

  String _appendSearchParam(String url, Map<String, String> params) {
    params.forEach((key, value) {
      url = "$url&$key=$value";
    });
    return url;
  }

  String _appendSignature(String url, String secret) {
    const String SIGNATURE_KEY = "sig";
    String signature = _generateSignature(url, secret);
    return _appendSearchParam(url, {SIGNATURE_KEY: signature});
  }

  String _generateSignature(input, secret) {
    final Hmac hmac = Hmac(sha256, _getBytes(secret));
    return hmac.convert(_getBytes(input)).toString();
  }
}
