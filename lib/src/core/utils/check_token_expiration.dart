import 'package:jwt_decoder/jwt_decoder.dart';

bool isTokenExpired(String token) {
  return JwtDecoder.isExpired(token);
}

DateTime? getTokenExpiry(String token) {
  return JwtDecoder.getExpirationDate(token);
}
