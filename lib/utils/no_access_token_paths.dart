import 'package:bws_agreement_creator/utils/base_url.dart';

class NoAccessTokenPaths {
  static List<String> paths = [
    '$baseUrl/refreshToken',
    '$baseUrl/login',
    '$baseUrl/loginWithGoogle'
  ];
}
